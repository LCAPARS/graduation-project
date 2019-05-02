const express = require('express');
const router = express.Router();

router.get('/', async (req, res) => {
    res.render('index');
});
router.get('/credits', async (req, res) => {
    res.render('extras/credits');
});
router.get('/graduation_project', async (req, res) => {
    res.render('extras/graduation_project');
});

module.exports = router;