/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var hbs = require('hbs'),
    path = require('path');

module.exports = function (app) {

    hbs.registerPartials(path.join(__dirname , '../views/partials'));
    //set up view path and engine
    app.set('views', path.join(__dirname , '../views'));
    app.set('view engine', 'hbs');

};
