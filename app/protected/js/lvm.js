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

function Run($rootScope, $http) {

    $rootScope.affiliates = [
        { name: 'All (Non-Affiliated)', value: 0 },
        { name: 'Boston', value: 5 },
        { name: 'Project Lighthouse', value: 10 },
        { name: 'Fitchburg', value: 15 },
        { name: 'Framingham', value: 20 },
        { name: 'Lowell', value: 25 },
        { name: 'Norwood', value: 30 },
        { name: 'Orange-Athol', value: 35 },
        { name: 'Pittsfield', value: 40 },
        { name: 'Quaboag Valley', value: 45 },
        { name: 'Quincy', value: 50 },
        { name: 'Tri.Community', value: 60 },
        { name: 'Stoughton', value: 65 },
        { name: 'Worcester', value: 70 },
        { name: 'Methuen', value: 75 }
    ];

    $rootScope.roles = [
        'Administrator',
        'Affiliate Coordinator',
        'Affiliate Staff',
        'Data Entry Contractor',
        'Tutor'
    ];

    $rootScope.mapNumToAffiliate = function (affiliateNum) {
        affiliateNum = _.isString(affiliateNum) ? parseInt(affiliateNum, 10) : affiliateNum;
        var affiliate = _.findWhere($rootScope.affiliates, {value: affiliateNum});
        return affiliate && affiliate.name;
    };

    var fetchUser = function () {
        $http({
        method: 'GET',
        url: '/user'
    }).then(function successCallback(response) {
        $rootScope.user = response.data.user;
      }, function errorCallback(response) {
        // Redirect to login?
        $rootScope.user = {};
      });
    };

    fetchUser();
}

//function to launch modal with the inputted text as the body
function popMessageModal(title,content,element) {
  $('.modal-title').text(title);
  $('.modal-body').html(content);
  $(element).modal('toggle');
}

//declare app level module and hook in config and run blocks
angular.module('lvmApp', ["angucomplete-alt"])
    .config(Config)
    .run(Run);
