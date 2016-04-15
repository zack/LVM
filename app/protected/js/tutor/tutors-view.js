/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */
'use strict';
angular.module('lvmApp')
    .controller('TutorController', function($scope, $http) {
        var form = this;
        $scope.tutors = [];
        $scope.getAllTutors = function() {
            //alert("Getting all Tutors!");
            $http({
                    method: 'GET',
                    url: 'api/tutor'
                })
                .success(function(data, status) {
                    $scope.tutors = data;
                })
                .error(function(data, status) {
                    alert("Error!");
                });
        };
    });
