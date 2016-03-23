/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var _ = require('underscore');

var failedLoginAttemptsTimeout = 1000 * 60 * 10; // 10 minutes

var passwordMeetsRequirements = function (pw) {
    // TODO: determine password reqmts
    return pw.length < 256;
};

module.exports = function (auth, statusCodes) {
    return {
        
        // Requires: req.body.username, req.body.password, req.body.role, req.body.branch
        createAccount : function (req, res, next) {
            if (!req.body.username) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A username is required.');
            } else if (auth.checkUsernameExists(req.body.username)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('The username is already in use.');
            } else if (!req.body.password) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A password is required.');
            } else if (!passwordMeetsRequirements(req.body.password)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('The password does not meet the requirements.');
            } else if (!req.body.role || !_.isString(req.body.role)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A user role is required.');
            } else if (!req.body.branch || !_.isNumber(req.body.branch)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('An affiliate branch is required.');
            }
            var resp = auth.addUser(req.body.username, req.body.password, req.body.role, {branch : req.body.branch});
            return resp ? res.send('Account created successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred creating the account.');
        },
        
        // Requires: req.body.username
        deleteAccount : function (req, res, next) {
            if (!req.body.username) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A username is required.');
            }
            var resp = auth.removeUser(req.body.username);
            return resp ? res.send('Account deleted successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred deleting the account.');
        },
        
        // Requires: req.body.username, req.body.password, req.body.newPassword
        updatePassword : function (req, res, next) {
            if (!req.body.username) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A username is required.');
            } else if (!req.body.password) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('The current password is required.');
            } else if (!auth.authenticate(req.body.username, req.body.password)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('Could not authenticate. The current password does not match.');
            } else if (!req.body.newPassword) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A new password is required.');
            } else if (!passwordMeetsRequirements(req.body.newPassword)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('The new password does not meet the requirements.');
            }
            var resp = auth.updatePassword(req.body.username, req.body.newPassword);
            return resp ? res.send('Password was updated successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred updating the password.');
        },
        
        // Requires: req.body.username, req.body.branch
        updateBranch : function (req, res, next) {
            if (!req.body.username) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A username is required.');
            } else if (!req.body.branch || !_.isNumber(req.body.branch)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('An affiliate branch is required.');
            }
            var resp = auth.updateAccountField(req.body.username, 'branch', req.body.branch);
            return resp ? res.send('Branch was updated successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred updating the branch.');
        },
        
        // Requires: req.body.username, req.body.role
        updateRole : function (req, res, next) {
            if (!req.body.username) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A username is required.');
            } else if (!req.body.role || !_.isString(req.body.role)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A user role is required.');
            }
            var resp = auth.updateRole(req.body.username, req.body.role);
            return resp ? res.send('Role was updated successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred updating the branch.');
        },
        
        // Requires: req.body.username, req.body.password
        login : function (req, res, next) {
            if (!req.body.username) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A username is required.');
            } else if (!req.body.password) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('A password is required.');
            }
            req.session.loginAttempts = (req.session.loginAttempts || 0) + 1;
            // 3 login attempts
            if (req.session.lastLoginAttemptTime && req.session.loginAttempts > 2 && ((new Date().getTime()) - req.session.lastLoginAttemptTime) < failedLoginAttemptsTimeout) {
                return res.redirect('/lvm/login?errorMessage=Maximum login attempts reached. Please try again in 10 minutes.');
            }
            req.session.lastLoginAttemptTime = new Date().getTime();
            var authResp = auth.authenticate(req.body.username, req.body.password);
            if (!authResp) { return res.redirect('/lvm/login?errorMessage=Bad username or password.'); }
            // authResp is the user object at this point since it was not false
            req.session.regenerate(function(err) {
                if (err) {
                    return res.redirect('/lvm/login?errorMessage=Unable to create a new session.');
                }
                req.session.user = authResp;
                return res.redirect('/lvm/dashboard');
            });
        },
        
        logout : function (req, res, next) {
            // destroy user session
            req.session.destroy(function(err) {
              if (err) {
                  return res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred.');
              }
              res.redirect('/lvm/login');
            });
        }
    };
};