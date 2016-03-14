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
        next(error);
    };

    /** API Routes **/

    /** ADMIN Routes **/

    /** FRONT-END Route **/
    
    router.use('/login', HomeController.login);
    router.use('/authenticate', AuthenticationController.login);
    router.use('/logout', AuthenticationController.logout);
    
    router.use('/dashboard', function (req, res, next) {
        res.send('It works!');
    });

    router.route('/')
        .all(HomeController.index);

    return router;
};