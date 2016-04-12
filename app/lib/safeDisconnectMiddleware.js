/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var mysql = require('mysql');

module.exports = function(logging, config, database, sessionStore) {

    // Setup safe disconnection from the database
    process.stdin.resume(); //so the program will not close instantly
    
    var exitHandler = function (options, err) {
        if (err) { console.log(err.stack); }
        if (options.exit) {
            database.end();
            logging.info('Database safely disconnected.');
            sessionStore.closeStore();
            logging.info('Session store safely closed.');
            process.exit();
        }
    };
    
    //catches ctrl+c event
    process.on('SIGINT', exitHandler.bind(null, {exit: true}));
    
    //catches uncaught exceptions
    process.on('uncaughtException', exitHandler.bind(null, {exit: true}));
    
    logging.info('Safe disconnect middleware initialized.');
    
    return {};
};