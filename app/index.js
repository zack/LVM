/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

var train = require('express-train'),
    consoleStamp = require('console-stamp'),
    promise = require('bluebird');

/* this will add timestamps to all console logs in case
 * they escape out. Though, we should be striving to use
 * our configured logger for everything.
 */
consoleStamp(console, 'yyyy-mm-dd HH:MM:ss.l');

/**
 * Add to object prototype to use clone function on any object
 */
Object.defineProperty(Object.prototype, 'deepCopyClone', {value: function(){
    return JSON.parse(JSON.stringify(this));
}});

/* pulling in our own custom config telling where express train can find it gives us some flexibility
 * to be able to pull a config file from a directory on a server but use one embedded within the project
 * for local development.
 */
var envConfig = require('./lib/envConfig')();

console.log('Configuring Express-Train from file: ' + envConfig.express_train_config_file_location) ;
var tree = train({
    base : __dirname,
    files : [
        '**/*.js',
        '!{protected, public, views, test, node_modules}/**'
    ]
});

//Adding request as a constant which can be injected in to other modules
//This allows us to mock out the library for unit testing purposes.
tree.constant('request', promise.promisifyAll(require('request')));
//This allows us to use the regular request() method rather than sub methods on the request object as a promise
tree.constant('requestAsync', promise.promisify(require('request')));
tree.constant('fs', promise.promisifyAll(require('fs')));

module.exports = tree.resolve();


