/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 *
 * Created by: Michael Rodrigues
 */
'use strict';
angular.module('lvmApp')
    .controller('MatchController', function($scope, $http) {
        var form = this;
        
        // form.createMatch = function () {
        //     $http({
        //         method: 'POST',
        //         url: '/api/matches'
        //     }).then(function (response) {
                
        //     }, function (response) {
        //         form.matchCreated = false;
        //         form.matchErrorMessage = response.data;
        //     });
        // };
        
        form.fetchMatches = function () {
            $http({
                method: 'GET',
                url: '/api/matches'
            }).then(function successCallback(response) {
                form.matches = response.data;
              }, function errorCallback(response) {
                form.fetchError = true;
              });
        };
        

        form.fetchMatches();
    });