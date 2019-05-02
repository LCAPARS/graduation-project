const express = require('express');
const router = express.Router();

const pool = require('../database');

router.get('/:name', async (req, res) => {
    const { name } = req.params;
    const sub = await pool.query('SELECT * FROM subjects WHERE NAME = ?', [name]);
    const entry = await pool.query('SELECT * FROM entries WHERE SUBJECT = ?', [sub[0].id]);
    const h = {
        materia: sub[0], 
        entries: entry
    };
    res.render('subjects/subject', h);
});

router.get('/:subject/:id', async (req, res)=>{
    const {id} = req.params;
    const {subject} = req.params;
    const sub = await pool.query('SELECT * FROM subjects WHERE NAME = ?', [subject]);
    const entry = await pool.query('SELECT * FROM entries WHERE ID = ?', [id]);
    const h = {
        materia: sub[0], 
        entry: entry[0]
    };
    res.render('subjects/topic', h);
});

module.exports = router;