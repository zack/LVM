/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var pjson = require('../../package.json'),
    _ = require('underscore');

module.exports = function (envConfig, constants, statusCodes) {
    return {
        // Landing page
        index: function (req, res, next) {
            res.render('index', {
                homeConfig: {

                    version: pjson.version,

                    envConfig: JSON.stringify(_.extend(envConfig, {
                        statusCodes: statusCodes
                    })),

                    constants: constants
                }
            });
        },
        
        login: function (req, res, next) {
            res.render('login', {
                homeConfig: {

                    version: pjson.version,

                    envConfig: JSON.stringify(_.extend(envConfig, {
                        statusCodes: statusCodes
                    })),

                    constants: constants
                }
            });
        }
    };
};