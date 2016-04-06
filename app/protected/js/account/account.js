/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 *
 * Created by: Michael Rodrigues
 */
'use strict';
angular.module('lvmApp')
    .controller('AccountController', function($scope, $http) {
        var form = this;
        
        $scope.resetState = function () {
            form.manageStatus = null;
            form.errorManageMessage = '';
            $scope.$apply();
        };
        
        form.mapNumToAffiliate = function (affiliateNum) {
            var affiliate = _.findWhere(form.affiliates, {value: affiliateNum});
            return affiliate && affiliate.name;
        };
        
        form.affiliates = [
            { name: 'Administrator (Non-Affiliated)', value: 0 },
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
        ];
        
        form.updatePassword = function (username) {
            return $http({
                method: 'POST',
                url: '/lvm/api/account/password',
                data: {
                    username: username,
                    newPassword: $scope.password,
                }
            }).then(function successCallback(response) {
                    form.manageStatus = true;
                    $scope.password = "";
                    setTimeout($scope.resetState, 5 * 1000);
                }, function errorCallback(response) {
                    form.manageStatus = false;
                    form.errorManageMessage = response.data;
                    setTimeout($scope.resetState, 5 * 1000);
                });
        };
    });