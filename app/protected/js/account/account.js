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
        
        var mapNumToAffiliate = function (affiliateNum) {
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
        
        form.roles = [
            'Administrator',
            'Affiliate Coordinator',
            'Affiliate Staff',
            'Tutor'
        ];
        
        $scope.fetchAccounts = function () {
            $http({
                method: 'GET',
                url: '/lvm/api/accounts'
            }).then(function successCallback(response) {
                form.accounts = _.map(response.data, function (account) {
                    account.branchName = mapNumToAffiliate(account.branch);
                    return account;
                });
                
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
                    $scope.fetchAccounts();
                    setTimeout(resetState, 5 * 1000);
                }, function errorCallback(response) {
                    form.accountCreated = false;
                    form.accountCreationErrorMessage = response.data;
                    setTimeout(resetState, 5 * 1000);
                });
        };
        
        form.updatePassword = function (username) {
            var newPassword = prompt("Please enter your name");
            
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
                }, function errorCallback(response) {
                    form.manageStatus = false;
                    form.errorManageMessage = response.data;
                    setTimeout($scope.resetStateManage, 5 * 1000);
                });
        };
        
        form.updateAffiliate = function (username, index) {
            var confirmation = confirm('Are you sure you would like to modify this account?');
            if (!confirmation) { return null; }
            
            return $http({
                method: 'POST',
                url: '/lvm/api/account/branch',
                data: {
                    username: username,
                    branch: parseInt($scope.manageAffiliates[index], 10),
                }
            }).then(function successCallback(response) {
                    form.manageStatus = true;
                    form.successManageMessage = 'Affiliate updated successfully!';
                    $scope.fetchAccounts();
                    setTimeout($scope.resetStateManage, 5 * 1000);
                }, function errorCallback(response) {
                    form.manageStatus = false;
                    form.errorManageMessage = response.data;
                    setTimeout($scope.resetStateManage, 5 * 1000);
                });
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
                    $scope.fetchAccounts();
                    setTimeout($scope.resetStateManage, 5 * 1000);
                }, function errorCallback(response) {
                    form.manageStatus = false;
                    form.errorManageMessage = response.data;
                    setTimeout($scope.resetStateManage, 5 * 1000);
                });
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
                    $scope.fetchAccounts();
                    setTimeout($scope.resetStateManage, 5 * 1000);
                }, function errorCallback(response) {
                    form.manageStatus = false;
                    form.errorManageMessage = response.data;
                    setTimeout($scope.resetStateManage, 5 * 1000);
                });
        };
        
        $scope.fetchAccounts();
    });