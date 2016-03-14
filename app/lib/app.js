/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';
//Express-train will export this as our app
//allows override of app
var express = require('express');

module.exports = function(){
    var app = express();
    return app;
};
