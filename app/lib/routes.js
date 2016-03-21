/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var express = require('express');

/*jshint -W072 */
module.exports = function (app, envConfig, statusCodes, HomeController, AuthenticationController) {
/*jshint +W072 */

    var router = express.Router();

    /**
     * Sends 405 for routes that are not allowed in this model
     */
    var methodNotAllowed = function (req, res, next) {
        var error = new Error('Non supported method.');
        error.status = statusCodes.METHOD_NOT_ALLOWED;
        return next(error);
    };
    
    // --------------------------------------------------------------    
    // UNPROTECTED ROUTES:
    
        // API
    
    // authentication route
    router.route('/account/login')
        .post(AuthenticationController.login)
        .all(methodNotAllowed);
    
        // FRONT-END
    
    // Login route
    router.route('/login')
        .get(HomeController.login)
        .all(methodNotAllowed);
        
    // Home/Landing page - redirect to login
    router.route('/')
        .all(function (req, res, next) { res.redirect('/lvm/login'); });

    // --------------------------------------------------------------    
    // PROTECTED ROUTES:
    // Verify there is a user logged in before allowing access
    router.use(function(req, res, next) {
        // Redirect to the login page if there is no user logged in
        if (!req.session.user) {
            return res.redirect('/lvm/login');
        } else {
            // Otherwise, allow the user through to the next matching route
            return next();
        }
    });

        // API
    router.route('/logout')
        .get(AuthenticationController.logout)
        .all(methodNotAllowed);

        // ADMIN

        // FRONT-END
    router.route('/dashboard')
        .get(HomeController.dashboard)
        .all(methodNotAllowed);
        
    router.route('/add-student')
        .get(HomeController.addStudent)
        .all(methodNotAllowed);

    return router;
};