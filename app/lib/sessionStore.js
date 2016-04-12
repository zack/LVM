/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var session = session = require('express-session'),
    MySQLStore = require('express-mysql-session')(session);

module.exports = function(config) {

    var options = {
    	host: config.database_url,
    	user: config.database_user,
    	password: config.database_password,
    	database: config.session_database_name,
    	createDatabaseTable: true,
    	schema: {
    		tableName: 'sessions',
    		columnNames: {
    			session_id: 'session_id',
    			expires: 'expires',
    			data: 'data'
    		}
    	}
    },
        sessionStore = new MySQLStore(options);
    
    return sessionStore;
};