/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created by: Michael Rodrigues
 */

'use strict';

/**
 * Configuration Function for Main App Module
 * @ngInject
 */
function Config($locationProvider, $httpProvider) {

    //gets rid of the # in urls
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false,
        rewriteLinks: false
    });

    //Disable all caching for HTTP get requests
    if (!$httpProvider.defaults.headers.get) {
        $httpProvider.defaults.headers.get = {};
    }

    //disable IE ajax request caching
    $httpProvider.defaults.headers.get['If-Modified-Since'] = '0';
}

//declare app level module and hook in config and run blocks
angular.module('lvmApp', [])
    .config(Config);