/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 *
 * Created by: Michael Rodrigues
 */
'use strict';
angular.module('lvmApp')
    .controller('AdminController', function($scope, $http) {
        var form = this;
        
        $scope.role = "-1";
        $scope.affiliate = "-1";
        
        $scope.resetStateManage = function () {
            form.manageStatus = null;
            form.successManageMessage = '';
            form.errorManageMessage = '';
            $scope.$apply();
        };
        
        $scope.manageRoles = [];
        $scope.manageAffiliates = [];
        
        form.fetchAccounts = function () {
            $http({
                method: 'GET',
                url: '/lvm/api/accounts'
            }).then(function successCallback(response) {
                form.accounts = response.data;
                
                // Setup the state arrays
                _.each(form.accounts, function (item, index) {
                    $scope.manageRoles[index] = "-1";
                    $scope.manageAffiliates[index] = "-1";
                });
              }, function errorCallback(response) {
                form.fetchAccountsError = true;
              });
        };
        
        form.createAccount = function () {
            var resetState = function () {
                form.accountCreated = null;
                form.accountCreationErrorMessage = '';
                $scope.$apply();
            };
            
            return $http({
                method: 'POST',
                url: '/lvm/api/account',
                data: {
                    username: $scope.username,
                    password: $scope.password,
                    role: $scope.role,
                    branch: parseInt($scope.affiliate, 10)
                }
            }).then(function successCallback(response) {
                    form.accountCreated = true;
                    form.fetchAccounts();
                    setTimeout(resetState, 5 * 1000);
                }, function errorCallback(response) {
                    form.accountCreated = false;
                    form.accountCreationErrorMessage = response.data;
                    setTimeout(resetState, 5 * 1000);
                });
        };
        
        var manageErrorCallback = function (response) {
            form.manageStatus = false;
            form.errorManageMessage = response.data;
            setTimeout($scope.resetStateManage, 5 * 1000);
        };
        
        form.updatePassword = function (username) {
            var newPassword = prompt("Please enter a new password.");
            
            return $http({
                method: 'POST',
                url: '/lvm/api/account/password',
                data: {
                    username: username,
                    newPassword: newPassword,
                }
            }).then(function successCallback(response) {
                    form.manageStatus = true;
                    form.successManageMessage = 'Password updated successfully!';
                    setTimeout($scope.resetStateManage, 5 * 1000);
                }, manageErrorCallback);
        };
        
        form.updateAffiliate = function (username, index) {
            var confirmation = confirm('Are you sure you would like to modify this account?');
            if (!confirmation) { 
                return null;
            }
            return $http({
                method: 'POST',
                url: '/lvm/api/account/branch',
                data: {
                    username: username,
                    branch: parseInt($scope.manageAffiliates[index], 10),
                }
            }).then(function (response) {
                    form.manageStatus = true;
                    form.successManageMessage = 'Affiliate updated successfully!';
                    form.fetchAccounts();
                    setTimeout($scope.resetStateManage, 5 * 1000);
                }, manageErrorCallback);
        };
        
        form.updateRole = function (username, index) {
            var confirmation = confirm('Are you sure you would like to modify this account?');
            if (!confirmation) { return null; }
            
            return $http({
                method: 'POST',
                url: '/lvm/api/account/role',
                data: {
                    username: username,
                    role: $scope.manageRoles[index],
                }
            }).then(function successCallback(response) {
                    form.manageStatus = true;
                    form.successManageMessage = 'Role updated successfully!';
                    form.fetchAccounts();
                    setTimeout($scope.resetStateManage, 5 * 1000);
                }, manageErrorCallback);
        };
        
        form.deleteAccount = function (username) {
            var confirmation = confirm('Are you sure you would like to delete this account?');
            if (!confirmation) { return null; }
            
            return $http({
                method: 'DELETE',
                url: '/lvm/api/account/{{username}}'.replace(/{{username}}/, username),
            }).then(function successCallback(response) {
                    form.manageStatus = true;
                    form.successManageMessage = 'Account deleted successfully!';
                    form.fetchAccounts();
                    setTimeout($scope.resetStateManage, 5 * 1000);
                }, manageErrorCallback);
        };
        
        form.fetchAccounts();
    });