const express = require('express');
const mysql = require('mysql');
require("dotenv").config()



const pool = mysql.createPool({
    connectionLimit: 100, //important
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'meetings',
})

const app = express();


app.use(express.json());


app.get('/teams', (req, res) => {
    pool.query("SELECT * FROM `coding_teams` WHERE 1", (err, data) => {
        if (err) return res.status(500)
        res.send(data.map(d => ({ ...d })))
    })

})

app.get('/teams/:id', (req, res) => {
    const id = req.params.id;
    console.log(id)
    pool.query("SELECT * FROM `team_meetings` WHERE meeting_code like ?" ,id,(err, data) => {
        if (err) return res.status(500)
        res.send(data.map(d => ({ ...d })))
    })

})


app.post('/teams',(req,res)=>{
    const values = Object.values(req.body)
console.log(values)
    pool.query("INSERT INTO `team_meetings`(`team_code`, `start_time`, `end_time`, `about_meeting`, `meeting_room`) VALUES (?,?,?,?,?)",values,(err,data)=>{
        if(err)return res.status(500)
        res.send(data)
    })
   
})


app.listen(process.env.PORT, () => console.log(`started at ${process.env.PORT}`))