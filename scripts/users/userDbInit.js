'use strict';

var config = require('../../config/default.json');
var accm = require('accm');

var userDb = accm(config.user_database_path);

// Setup the initial users:
userDb.addUser('roberta', 'litvolma', 'Administrator', {branch: 1});
userDb.addUser('grace', 'grace', 'Administrator', {branch: 1});