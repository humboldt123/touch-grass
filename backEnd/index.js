const cors = require('cors');
const express = require('express');
const fs = require("fs");
const csv = require('csv-parser');
const supabase = require("./utils/supabase");

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


