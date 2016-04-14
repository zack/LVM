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
        
        form.statuses = ['Current', 'Dissolved'];
        $scope.status = '-1';
        
        form.createMatch = function () {
            $http({
                method: 'POST',
                url: '/api/matches'
            }).then(function (response) {
                form.matchCreated = true;
            }, function (response) {
                form.matchCreated = false;
                form.matchErrorMessage = response.data;
            });
        };
        
        form.dissolveMatch = function (index) {
            $http({
                method: 'DELETE',
                url: '/api/matches/' + form.matches[index].id
            }).then(function (response) {
                form.matchDissolved = true;
            }, function (response) {
                form.matchDissolved = false;
                form.dissolveErrorMessage = response.data;
            });
        };
        
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