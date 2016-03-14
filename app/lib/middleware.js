/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var express = require('express'),
    cors = require('cors'),
    bodyParser = require('body-parser'),
    methodOverride = require('method-override'),
    session = require('express-session'),
    path = require('path'),
    connect_timeout = require('connect-timeout');

module.exports = function (app, config, routes, envConfig, errorMiddleware) {
    // Middleware stack for all requests
    app.use(cors());                                                                                  // enable all CORS requests
    app.use(envConfig.public.app_root_url, express.static(path.resolve(__dirname + '/../public')));   // static files in /public
    app.use(connect_timeout(envConfig.timeout.time));                                                 // request timeouts
    app.use(bodyParser.urlencoded({extended: false}));                                                // parse application/x-www-form-urlencoded
    app.use(bodyParser.json());                                                                       // parse application/json
    app.use(methodOverride('_method'));                                                               // post -> put and delete where not allowed in client
    app.use(session({ secret: 'literacy is the key!', cookie: { maxAge: 60000 }}));
    app.use(envConfig.public.app_root_url, routes);                                            // app router

    app.use(function(req, res, next){                                                                 // barebones 404 handler
        return res.status(404).send('Not Found.').end();
    });
    app.use(errorMiddleware.catchAllErrorHandler);                                                    // Handle errors from middleware/routes

};