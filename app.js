var express = require('express');

var app = express();

app.get('/', function(req, res) {
    res.send('Hello World, this is an update!\n'); });

app.listen(8081);

module.exports = app;
