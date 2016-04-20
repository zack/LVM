/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var pjson = require('../../package.json'),
    _ = require('underscore');

module.exports = function(envConfig, constants, statusCodes) {
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
        login: function(req, res, next) {
            res.render('login', _.extend(JSON.parse(JSON.stringify(config)), req.query));
        },

        dashboard: function(req, res, next) {
            res.render('dashboard', _.extend(JSON.parse(JSON.stringify(
                config)), {
                user: req.session.user
            }));
        },

        account: function(req, res, next) {
            res.render('account', config);
        },

        admin: function(req, res, next) {
            res.render('administration', config);
        },

        studentForm: function(req, res, next) {
            res.render('student-form', config);
        },

        students: function(req, res, next) {
          if (req.params.id) {
            res.render('single-student-view', config);
          } else {
            res.render('students-view', config);
          }
        },

        tutors: function(req, res, next) {
            if (req.params.id) {
                res.render('single-tutor-view', config);
            } else {
                res.render('tutors-view', config);
            }
        },

        matching: function(req, res, next) {
            res.render('matching', config);
        },
        
        export: function(req, res, next) {
            res.render('export', config);
        }
    };
};
