var express = require('express');

var app = express();

app.get('/', function(req, res) {
    res.send('Hello Jenkins!\n'); });

app.listen(8081);

module.exports = app;
