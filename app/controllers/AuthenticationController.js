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
    return pw.length < 256;
};


module.exports = function (auth, statusCodes) {
    var validateField = function (res, field, errorMsg, checkFn) {
        var valid = checkFn ? checkFn(field) : field;
        if (!valid) {
            res.status(statusCodes.BAD_REQUEST_STATUS).send(errorMsg);
            return false;
        }
        return valid;
    };

    return {
        // Requires: req.body.username, req.body.password, req.body.role, req.body.branch
        createAccount : function (req, res, next) {
            var validationFn = _.partial(validateField, res);
            var add = function () {
                var resp = auth.addUser(req.body.username, req.body.password, req.body.role, {branch : req.body.branch});
                return resp ? res.send('Account created successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred creating the account.');
            };
            var checkUserExists = function () {
                return !auth.checkUsernameExists(req.body.username);
            };
            
            return validationFn(req.body.username, 'A username is required.') &&
                    validationFn(req.body.username, 'The username is already in use.', checkUserExists) &&
                    validationFn(req.body.password, 'A password is required.') &&
                    validationFn(req.body.password, 'The password does not meet the requirements.', passwordMeetsRequirements) &&
                    validationFn(req.body.role, 'A user role is required.') &&
                    validationFn(req.body.role, 'A user role is required.', _.isString) &&
                    validationFn(req.body.branch, 'An affiliate branch is required.') &&
                    validationFn(req.body.branch, 'An affiliate branch is required.', _.isNumber) &&
                    add();
        },
        
        // Requires: req.body.username
        deleteAccount : function (req, res, next) {
            var validationFn = _.partial(validateField, res);
            var deleteUser = function () {
                var resp = auth.removeUser(req.body.username);
                return resp ? res.send('Account deleted successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred deleting the account.');
            };
            
            return validationFn(req.body.username, 'A username is required.') &&
                    deleteUser();
        },
        
        // Requires: req.body.username, req.body.password, req.body.newPassword
        updatePassword : function (req, res, next) {
            var validationFn = _.partial(validateField, res);
            var update = function () {
                var resp = auth.updatePassword(req.body.username, req.body.newPassword);
                return resp ? res.send('Password was updated successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred updating the password.');
            };
            var authenticate = function () {
                return auth.authenticate(req.body.username, req.body.password);
            };
            
            return validationFn(req.body.username, 'A username is required.') &&
                    validationFn(req.body.password, 'The current password is required.') &&
                    validationFn(req.body.password, 'Could not authenticate. The current password does not match.', authenticate) &&
                    validationFn(req.body.newPassword, 'A new password is required.') &&
                    validationFn(req.body.newPassword, 'The new password does not meet the requirements.', passwordMeetsRequirements) &&
                    update();
        },
        
        // Requires: req.body.username, req.body.branch
        updateBranch : function (req, res, next) {
            var validationFn = _.partial(validateField, res);
            var update = function () {
                var resp = auth.updateAccountField(req.body.username, 'branch', req.body.branch);
                return resp ? res.send('Branch was updated successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred updating the branch.');
            };
            
            return validationFn(req.body.username, 'A username is required.') &&
                    validationFn(req.body.branch, 'An affiliate branch is required.') &&
                    validationFn(req.body.branch, 'An affiliate branch is required.', _.isNumber) &&
                    update();
        },
        
        // Requires: req.body.username, req.body.role
        updateRole : function (req, res, next) {
            var validationFn = _.partial(validateField, res);
            var update = function () {
                var resp = auth.updateRole(req.body.username, req.body.role);
                return resp ? res.send('Role was updated successfully!') : res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred updating the branch.');
            };
            
            return validationFn(req.body.username, 'A username is required.') &&
                    validationFn(req.body.role, 'A user role is required.') &&
                    validationFn(req.body.role, 'A user role is required.', _.isString) &&
                    update();
        },
        
        // Requires: req.body.username, req.body.password
        login : function (req, res, next) {
            var redirectToLogin = function (errorMessage) {
                return res.redirect('/lvm/login?errorMessage=' + errorMessage);
            };
            
            if (!req.body.username) {
                return redirectToLogin('A username is required.');
            } else if (!req.body.password) {
                return redirectToLogin('A password is required.');
            }
            req.session.loginAttempts = (req.session.loginAttempts || 0) + 1;
            // 3 login attempts
            if (req.session.lastLoginAttemptTime && req.session.loginAttempts > 2 && ((new Date().getTime()) - req.session.lastLoginAttemptTime) < failedLoginAttemptsTimeout) {
                return redirectToLogin('Maximum login attempts reached. Please try again in 10 minutes.');
            }
            req.session.lastLoginAttemptTime = new Date().getTime();
            var authResp = auth.authenticate(req.body.username, req.body.password);
            if (!authResp) { return redirectToLogin('Bad username or password.'); }
            // authResp is the user object at this point since it was not false
            req.session.regenerate(function(err) {
                if (err) {
                    return redirectToLogin('Unable to create a new session.');
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