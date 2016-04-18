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
        $scope.fetchStatus = 'Current';
        $scope.editing = null;
        $scope.sites = _.filter($rootScope.affiliates, function (affiliate) { return affiliate.value; });
        
        form.enableEditing = function (index) {
            $scope.editing = index;
        };
        
        form.cancelEdit = function () {
            $scope.editing = null;
        };
        
        $scope.resetStateManage = function () {
            form.manageMatchResponse = null;
            form.manageSuccessMessage = '';
            form.manageErrorMessage = '';
            $scope.$apply();
        };
        
        form.mapFetchedMatches = function (match) {
            match.onHoldValue = (match.onHold === 0 ? false : true);
            match.site = match.site.toString();
            match.matchStart = new Date(match.matchStart);
            match.matchEnd = (!_.isNull(match.matchEnd) ? new Date(match.matchEnd) : match.matchEnd);
            return match;
        };
        
        form.createMatch = function () {
            var resetMessages = function () {
                form.matchCreated = null;
                form.matchErrorMessage = '';
            };
            
            $http({
                method: 'POST',
                url: '/api/matches',
                data: {
                    doeMatchID: $scope.doeMatchID,
                    student: $scope.student,
                    tutor: $scope.tutor,
                    status: $scope.status,
                    onHold: $scope.onHold,
                    matchStart: $scope.matchStart,
                    matchEnd: $scope.matchEnd || null
                }
            }).then(function (response) {
                form.matchCreated = true;
                form.fetchMatches();
                setTimeout(resetMessages, 5 * 1000);
            }, function (response) {
                form.matchCreated = false;
                form.matchErrorMessage = response.data;
                setTimeout(resetMessages, 5 * 1000);
            });
        };
        
        form.dissolveMatch = function (index) {
            $http({
                method: 'DELETE',
                url: '/api/matches/' + form.matches[index].id
            }).then(function (response) {
                form.manageMatchResponse = true;
                form.manageSuccessMessage = 'Match dissolved successfully.';
                form.fetchMatches();
                setTimeout($scope.resetStateManage, 5 * 1000);
            }, function (response) {
                form.manageMatchResponse = false;
                form.manageErrorMessage = response.data;
                setTimeout($scope.resetStateManage, 5 * 1000);
            });
        };
        
        form.reinstateMatch = function (index) {
            var match = form.matches[index];
            match.status = 'Current';
            match.matchEnd = null;
            form.updateMatch(index);
        };
        
        form.updateMatch = function (index) {
            var match = form.matches[index];
            // Map this from a boolean to a bit for the database
            match.onHold = (match.onHoldValue ? 1 : 0);
            
            $http({
                method: 'POST',
                url: '/api/matches/' + match.id,
                data: match
            }).then(function (response) {
                form.manageMatchResponse = true;
                form.manageSuccessMessage = 'Match updated successfully.';
                form.cancelEdit();
                setTimeout($scope.resetStateManage, 5 * 1000);
            }, function (response) {
                form.matchDissolved = false;
                form.dissolveErrorMessage = response.data;
            });
        };
        
        form.fetchMatches = function () {
            $http({
                method: 'GET',
                url: '/api/matches?status={{status}}'.replace('{{status}}', $scope.fetchStatus)
            }).then(function successCallback(response) {
                form.matches = _.map(response.data, form.mapFetchedMatches);
              }, function errorCallback(response) {
                form.fetchError = true;
              });
        };
        

        form.fetchMatches();
    });