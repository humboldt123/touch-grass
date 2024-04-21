require("dotenv").config();
const OpenAI = require("openai");
const cors = require("cors");
const express = require("express");
const { exec } = require("child_process");
const app = express();
app.use(cors()); // Enable CORS
app.use(express.json());
const supabase = require("./utils/supabase");
const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY });
app.get("/", (req, res) => {
  res.json({ message: "Hello from the server!" });
});

async function postToSupabase(groupNums) {
  const numsPromise = [];
  for (let num of groupNums) {
    numsPromise.push(
      await supabase
        .from("group")
        .insert([{ id: num }])
        .select()
    );
  }
  Promise.all(numsPromise).then((values) => {
    console.log("succedded");
  });
}

// async function test(num){
//     const eventPairs = [];
//     const eventPair = await supabase.from('affair').upsert([{ group: num, event_name: "eat hot cream", description: "very hot? Literally!" }]);
//     eventPairs.push(eventPair);
//     Promise.all(eventPairs).then((values) => {
//         console.log("succedded");
//     });
//     return eventPair;
// }
async function gptGenerateEvents1(contents) {
  let eventName = "";
  let eventDes = "";
  const prompt1 =
    "give me only a few words, describe what this person should do today, don't add the propositions, just the event:";
  const prompt2 =
    "add a semicolon, in a sentence or two, introduce what this event is and why this event while avoiding any references of political incorrect words";
  for (let content of contents) {
    const completion = await openai.chat.completions.create({
      messages: [{ role: "system", content: prompt1 + content + prompt2 }],
      model: "gpt-4",
    });
    const eventsAndDes = completion.choices[0].message.content.split(";");
    eventName = eventsAndDes[0].trim(); // Use trim() to remove any leading/trailing whitespace
    if (eventsAndDes.length < 2)
      eventDes = "Find out more by attending the event!";
    else {
      console.log("Des: " + eventsAndDes[1]);
      console.log("Name" + eventsAndDes[0]);
      eventName = eventsAndDes[0].trim();
      eventDes = eventsAndDes[1].trim();
    }
    const eventPairs = [];
    const eventPair = await supabase
      .from("affair")
      .insert([
        { group: groupNum, event_name: eventName, description: eventDes },
      ]);
    eventPairs.push(eventPair);
    Promise.all(eventPairs).then((values) => {
      console.log("succedded");
    });
  }
}

async function gptGenerateEvents(content) {
  const prompt1 =
    "give me only a few words, describe what this person should do today, don't add the propositions, just the event:";
  const prompt2 =
    "add a semicolon, in a sentence or two, introduce what this event is and why this event while avoiding any references of political incorrect words";

  const completion = await openai.chat.completions.create({
    messages: [{ role: "system", content: prompt1 + content[0] + prompt2 }],
    model: "gpt-4",
  });
  const eventsAndDes = completion.choices[0].message.content.split(";");
  return eventsAndDes;
}

async function pushGPTContent(eventsAndDes, num) {
  const eventPairs = [];
  let eventName = eventsAndDes[0].trim();
  let eventDes =
    eventsAndDes.length < 2
      ? "Find out more by attending the event!"
      : eventsAndDes[1].trim();

  console.log("Event Name: " + eventName);
  console.log("Event Description: " + eventDes);

  const insertPromise = supabase
    .from("affair")
    .insert([{ group: num, event_name: eventName, description: eventDes }]);

  eventPairs.push(insertPromise);
  Promise.all(eventPairs)
    .then((values) => {
      console.log("All inserts succeeded");
      return values;
    })
    .catch((error) => {
      console.error("Error in inserts: ", error);
      throw error; // Re-throw to make sure errors are not silently ignored
    });
}

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

app.post("/newUserProfile", (req, res) => {
  console.log("Received new user profile:", req.body);
  const userData = req.body;
  const userDataString = JSON.stringify(userData);
  let generatedGroupNumbers = [];

  console.log(userDataString);
  exec(
    `python3 mock_ai_model.py '${userDataString}'`,
    (error, stdout, stderr) => {
      if (error) {
        console.error(`exec error: ${error}`);
        return res.status(500).send("Error running the AI model");
      }
      if (stderr) {
        console.error(`stderr: ${stderr}`);
        return res.status(500).send("AI model ran with errors");
      }

      const groupNumber = stdout
        .trim()
        .split(",")
        .map((num) => parseInt(num.trim(), 10));
      userData.groupNumber = groupNumber;
      console.log(groupNumber);
      console.log("this is the data:" + userData);
      generatedGroupNumbers = groupNumber;
      postToSupabase(generatedGroupNumbers)
        .then(() => {
          res.send("Data sent to Supabase successfully");
        })
        .catch((error) => {
          res.status(500).send("Failed to send data to Supabase");
        });
    }
  );
});

const calculateGroupInfo = require("./calculateGroupInfo");
app.get("/calculate", calculateGroupInfo);

app.post("/generateEvents", calculateGroupInfo, (req, res) => {
  const events = [];
  const groupInfoStrings = req.groupInfoStrings;
  console.log(groupInfoStrings[0]);
  for (let i = 0; i < groupInfoStrings.length; i++) {
    gptGenerateEvents(groupInfoStrings[i])
      .then((eventsAndDes) => {
        pushGPTContent(eventsAndDes, i)
          .then((values) => {
            events.push(values);
          })
          .catch((error) => {
            console.error("Error in pushGPTContent: ", error);
            res.status(500).send("Error in pushGPTContent");
          });
      })
      .catch((error) => {
        console.error("Error in gptGenerateEvents: ", error);
        res.status(500).send("Error in gptGenerateEvents");
      });
  }
  Promise.all(events)
    .then((values) => {
      res.send("Events generated successfully");
    })
    .catch((error) => {
      console.error("Error in events: ", error);
    });
});
