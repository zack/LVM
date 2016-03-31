/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var mysql = require('mysql');

module.exports = function(logging, config) {

    var connection = mysql.createConnection({
        host     : config.database_url,
        user     : config.database_user,
        password : config.database_password,
        database : config.database_name
    });
    
    connection.connect(function(err) {
        if (err) {
            logging.error('database: connection error', err.stack);
            return;
        } 
     
        logging.info('database: successfully connected. id: ' + connection.threadId);
    });
    
    // Setup safe disconnection from the database
    process.stdin.resume(); //so the program will not close instantly
    
    var exitHandler = function (options, err) {
        if (err) console.log(err.stack);
        if (options.exit) {
            connection.end();
            logging.info('Database safely disconnected.');
            process.exit();
        }
    };
    
    //catches ctrl+c event
    process.on('SIGINT', exitHandler.bind(null, {exit: true}));
    
    //catches uncaught exceptions
    process.on('uncaughtException', exitHandler.bind(null, {exit: true}));
    
    return connection;
};