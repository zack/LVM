/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 *
 * Created by: Michael Rodrigues
 */
'use strict';
angular.module('lvmApp')
    .controller('MatchController', function($scope, $http, $rootScope) {
        var form = this;
        
        form.statuses = ['Current', 'Dissolved'];
        $scope.status = '-1';
        $scope.editing = null;
        $scope.sites = _.filter($rootScope.affiliates, function (affiliate) { return affiliate.value; });
        
        form.enableEditing = function (index) {
            $scope.editing = index;
            $scope.matchStart = form.matches[index].matchStart;
            
        };
        
        form.cancelEdit = function () {
            $scope.editing = null;
        };
        
        form.mapFetchedMatches = function (match) {
            match.onHoldValue = (match.onHold === 0 ? false : true);
            match.site = match.site.toString();
            return match;
        };
        
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
        
        form.updateMatch = function (index) {
            var match = form.matches[index];
            // Map this from a boolean to a bit for the database
            match.onHold = (match.onHoldVal ? 1 : 0);
            
            $http({
                method: 'POST',
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
                form.matches = _.map(response.data, form.mapFetchedMatches);
              }, function errorCallback(response) {
                form.fetchError = true;
              });
        };
        

        form.fetchMatches();
    });