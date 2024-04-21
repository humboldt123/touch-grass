const OpenAI = require("openai");
const cors = require('cors');
const express = require('express');
const { exec } = require('child_process');
const app = express();
app.use(cors()); // Enable CORS
app.use(express.json());
const supabase = require('./utils/supabase')
const openai = new OpenAI({ apiKey: process.env.OPENAI_API_KEY});

app.get('/', (req, res) => {
    res.json({ message: 'Hello from the server!' });
});

async function postToSupabase(groupNums) {
    const numsPromise = [];
    for (let num of groupNums)
    {
        numsPromise.push(await supabase.from('group').insert([{ id: num }]).select());
    }
    Promise.all(numsPromise).then((values) => {
        console.log("succedded");
    });
}

async function gptGenerateEvents(){
    const completion = await openai.chat.completions.create({
        messages: [{ role: "system", content: "You are a helpful assistant." }],
        model: "gpt-3.5-turbo",
    });
    const eventsAndDes = completion.choices[0].message.content;
    console.log("this is completion\n" + eventsAndDes);
    var eventName = "swim";
    var eventDes = "go to swim!";
    const eventPairs = [];
    eventPairs.push(await supabase.from('affair').insert([{ event_name: eventName, description: eventDes }]))
    Promise.all(eventPairs).then((values) => {
        console.log("succedded");
    });
    return completion;
}

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

app.post('/newUserProfile', (req, res) => {

    console.log('Received new user profile:', req.body);
    const userData = req.body;
    const userDataString = JSON.stringify(userData);
    let generatedGroupNumbers = [];

    exec(`python3 mock_ai_model.py '${userDataString}'`, (error, stdout, stderr) => {
        if (error) {
            console.error(`exec error: ${error}`);
            return res.status(500).send('Error running the AI model');
        }
        if (stderr) {
            console.error(`stderr: ${stderr}`);
            return res.status(500).send('AI model ran with errors');
        }

        const groupNumber = stdout.trim().split(',').map(num => parseInt(num.trim(), 10));;
        userData.groupNumber = groupNumber;

        console.log("this is the data:" + userData)
        generatedGroupNumbers = groupNumber;
        postToSupabase(generatedGroupNumbers).then(() => {
            res.send('Data sent to Supabase successfully');
        }).catch(error => {
            res.status(500).send('Failed to send data to Supabase');
        });
    });
});

app.post('/generateEvents', (req, res) => {
    const group_events = [];

    const completion = gptGenerateEvents();

    console.log(completion.choices[0]);
})


