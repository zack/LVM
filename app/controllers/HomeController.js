/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var pjson = require('../../package.json'),
    _ = require('underscore');

module.exports = function (envConfig, constants, statusCodes) {
    var config = {
        homeConfig: {

            version: pjson.version,

            envConfig: JSON.stringify(_.extend(envConfig, {
                statusCodes: statusCodes
            })),

            constants: constants
        }
    };
    
    return {
        // Landing & Login page
        login: function (req, res, next) {
            res.render('login', _.extend(config, req.query));
        },
        
        dashboard: function (req, res, next) {
            res.render('dashboard', _.extend(config, {user: req.session.user}));
        }
    };
};