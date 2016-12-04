/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */
'use strict';
angular.module('lvmApp')
    .controller('StudentController', function($scope, $location, $http) {
        var form = this;
        var studentId = $location.path().split("/")[2] || -1;
        console.log("Student ID is " + studentId);
        $scope.students = [];
        $scope.selectedStudent = null;
        $scope.getAllStudents = function() {
            $http({
                    method: 'GET',
                    url: (studentId == -1 ? '/api/student/' : '/api/student/' + studentId)
                })
                .success(function(data, status) {
                    $scope.students = data;
                    $scope.selectedStudent = data;
                })
                .error(function(data, status) {
                    popMessageModal('Error',"An error ocurred. Please contact your system administrator.",'#messageModal');
                });
        };
    });
