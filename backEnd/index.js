const cors = require('cors');
const express = require('express');
const { exec } = require('child_process');
const app = express();
app.use(cors()); // Enable CORS
app.use(express.json()); // Parse JSON bodies

app.get('/', (req, res) => {
  res.json({ message: 'Hello from the server!' });
});

app.post('/upload-csv', (req, res) => {
  const results = [];
  fs.createReadStream('user_data.csv')
      .pipe(csv())
      .on('data', (data) => results.push(data))
      .on('end', () => {
        console.log(results);
        const groupNums = results.map(item => item.groupNum);
        postToSupabase(groupNums).then(() => {
          res.send('Data sent to Supabase successfully');
        }).catch(error => {
          res.status(500).send('Failed to send data to Supabase');
        });
      });
});

async function postToSupabase(groupNums) {
  for (let num of groupNums) {
    await supabase.from('User').insert([{ id: num }]);
  }
}

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});

app.post('/newUserProfile', (req, res) => {

  console.log('Received new user profile:', req.body);
  const userData = req.body;
  const userDataString = JSON.stringify(userData);

  exec(`python mock_ai_model.py '${userDataString}'`, (error, stdout, stderr) => {
      if (error) {
          console.error(`exec error: ${error}`);
          return res.status(500).send('Error running the AI model');
      }
      if (stderr) {
          console.error(`stderr: ${stderr}`);
          return res.status(500).send('AI model ran with errors');
      }

      const groupNumber = stdout.trim();
      userData.groupNumber = groupNumber;

      console.log(userData)
      // insert to supabase database

      res.status(200).json(userData);
  });
});


