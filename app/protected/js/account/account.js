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
        
        $scope.oldPassword = '';
        $scope.password = '';
        
        $scope.resetState = function () {
            form.updateStatus = null;
            form.errorMessage = '';
            $scope.$apply();
        };
        
        form.updatePassword = function (username) {
            return $http({
                method: 'POST',
                url: '/api/account/password',
                data: {
                    username: username,
                    oldPassword: $scope.oldPassword,
                    newPassword: $scope.password,
                }
            }).then(function successCallback(response) {
                    form.updateStatus = true;
                    $scope.oldPassword = "";
                    $scope.password = "";
                    setTimeout($scope.resetState, 5 * 1000);
                }, function errorCallback(response) {
                    form.updateStatus = false;
                    form.errorMessage = response.data;
                    setTimeout($scope.resetState, 5 * 1000);
                });
        };
    });