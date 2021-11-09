// Web Server
const express = require('express');
const app = express()
const cors = require("cors")
const pool = require("./creds")
const path = require('path');


app.use(express.static('public'));
app.use(cors());
app.use(express.json());  // req.body


// Insert a new employee into the ElephantSQL employee database
app.post('/employees', async(req, res) => {
  try {
    const {id, first_name, last_name, job_title, salary} = req.body;
    console.log("Running SQL Insert command to insert into ElephantSQL database:", id, first_name, last_name, job_title, salary);
    const newDemo = await pool.query(`INSERT INTO employee (id, first_name, last_name, job, salary) VALUES ($1, $2, $3, $4, $5) RETURNING *;`, 
      [id, first_name, last_name, job_title, salary]);
    
    res.json(newDemo.rows[0]);
  }
  catch(err) {
    console.log(err.message);
  }
})

// Get all employees currently in database
app.get("/employees", async(req, res) => {
  try {
    const allEmployees = await pool.query("SELECT * FROM employee;");
    console.log(allEmployees.rows);
    res.json(allEmployees.rows);
  }
  catch (err) {
    console.log(err.message);
  }
})



app.get('*', function(req, res) {
  res.sendFile(path.join(__dirname + '/public/index.html'));
});

// Set up the server to listen to port 5000
const port = process.env.PORT || 5000;
app.listen(port, () => {
  console.log(`Server has started on port ${port}`);
});


