/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var mysql = require('mysql');

module.exports = function(logging, config) {

    var connection;
    
    var createConnection = function () {
        logging.info('Attempting to establish database connection...');
        connection = mysql.createConnection({
            host     : config.database_url,
            user     : config.database_user,
            password : config.database_password,
            database : config.database_name
        });
    };
    
    var connect = function () {
        connection.connect(function(err) {
            if (err) {
                logging.error('database: connection error', err.stack);
                return;
            } 
         
            logging.info('database: successfully connected. id: ' + connection.threadId);
        });
    };
    
    // Reconnection found at: http://stackoverflow.com/questions/17015590/node-js-mysql-needing-persistent-connection
    function handleDisconnect() {
        connection.on('error', function(err) {
            if (!err.fatal) {
                return;
            }
            if (err.code !== 'PROTOCOL_CONNECTION_LOST') {
                return logging.error(err);
            }
            logging.info('Re-connecting lost connection: ' + err.stack);
            connectToDatabase();
        });
    }
    
    var connectToDatabase = function () {
        createConnection();
        handleDisconnect();
        connect();
    };
    
    connectToDatabase();
    
    return connection;
};