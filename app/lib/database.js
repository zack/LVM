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
        password : config.database_password
        // TODO: add the specific database here
    });
    
    connection.connect(function(err) {
        if (err) {
            console.error('database: connection error.  Stack Trace: ' + err.stack);
            return;
        }
     
        console.log('database: successfully connected. id: ' + connection.threadId);
    });
    
    return connection;
    
};