/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */
'use strict';
angular.module('lvmApp')
    .controller('TutorController', function($scope, $location, $http) {
        var form = this;
        var tutorId = $location.path().split("/")[2] || -1;
        console.log("Tutor ID is " + tutorId);
        $scope.tutors = [];
        $scope.selectedTutor = null;
        $scope.getAllTutors = function() {
            $http({
                    method: 'GET',
                    url: (tutorId == -1 ? '/api/tutor/' : '/api/tutor/' + tutorId)
                })
                .success(function(data, status) {
                    $scope.tutors = data;
                    $scope.selectedTutor = data;
                })
                .error(function(data, status) {
                    alert("Error!");
                });
        };
    });
