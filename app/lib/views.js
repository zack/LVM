/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var marko = require('marko'),
    path = require('path');

module.exports = function (app) {

    // Setup the 'marko' engine which just loads the template file and calls render on it
    app.engine('marko', function(filePath, options, callback) {
        marko.load(filePath).render(options, function(err, output) {
            callback(err, output);
        });
    });

    //set up view path and engine
    app.set('views', path.join(__dirname , '../views'));
    app.set('view engine', 'marko');

};
