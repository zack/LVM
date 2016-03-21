"use strict";

module.exports = function(config) {
    config.set({

        files: [
            './lib/angular.js',
            './lib/angular-mocks.js',
            '../../app/public/js/**.js',
            '../../app/public/js/**/*.js',
            './**/*.js'
        ],

        frameworks: ["jasmine"],
        
        browsers : ['PhantomJS'],

        plugins: [
            "karma-jasmine",
            "karma-phantomjs-launcher"
        ],
        
        port: 9876,
        
        singleRun: true
    });
};