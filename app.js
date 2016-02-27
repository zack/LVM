var express = require('express');

var app = express();

app.get('/', function(req, res) {
    res.send('Hello World!\n');
});

app.listen(process.env.PORT || 8080);

module.exports = app;
