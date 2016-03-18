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
        console.log(req, res, next);
        var error = new Error('Non supported method.');
        error.status = statusCodes.METHOD_NOT_ALLOWED;
        return next(error);
    };
    
    var test = function (req, res) {
        res.send('It works!');
    };

    /** API Routes **/

    router.route('/login')
        .post(AuthenticationController.login)
        .all(methodNotAllowed);
    router.route('/logout')
        .get(AuthenticationController.logout)
        .all(methodNotAllowed);

    /** ADMIN Routes **/

    /** FRONT-END Route **/
    
    router.route('/dashboard')
        .get(function (req, res, next) { res.send('It works!'); })
        .all(methodNotAllowed);

    return router;
};