/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var accm = require('accm');

module.exports = function(config) {

    var userDb = accm(config.user_database_path);
    
    return userDb;
    
};