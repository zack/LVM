/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */
'use strict';
angular.module('lvmApp')
    .controller('TutorFormController', function ($scope, $window, $http) {
        var form = this;
        $scope.formDefinition = [
            {
                id: 'studentinfo',
                name: 'Student Information',
                fields: [
                    [
                        {
                            name: 'firstName',
                            class: 'col-md-3 required',
                            value: '',
                            type: 'text',
                            trim: true,
                            placeholder: 'First Name'
                        },
                        {
                            name: 'lastName',
                            class: 'col-md-3 required',
                            value: '',
                            type: 'text',
                            trim: true,
                            placeholder: 'Last Name'
                        },
                        {
                            name: 'dateOfBirth',
                            class: 'col-md-3 required',
                            value: '',
                            type: 'date',
                            trim: true,
                            placeholder: 'Date of Birth'
                        },
                        {
                            name: 'gender',
                            class: 'col-md-3 required',
                            value: '',
                            type: 'dropdown',
                            options: [{name: 'Male', value: 1}, {name: 'Female', value: 2}],
                            placeholder: 'Gender'
                        }
                      ]
                    ]
                  }
                ];

        $scope.availabilityTimes = {
            monMorn: false,
            tueMorn: false,
            wedMorn: false,
            thurMorn: false,
            friMorn: false,
            satMorn: false,
            sunMorn: false,
            monAfternoon: false,
            tueAfternoon: false,
            wedAfternoon: false,
            thurAfternoon: false,
            friAfternoon: false,
            satAfternoon: false,
            sunAfternoon: false,
            monEve: false,
            tueEve: false,
            wedEve: false,
            thurEve: false,
            friEve: false,
            satEve: false,
            sunEve: false


        };

        $scope.tutorPreferences = {
            maleTeen: false,
            male20: false,
            male26: false,
            male36: false,
            male46: false,
            male56: false,
            male66: false,
            femaleTeen: false,
            female20: false,
            female26: false,
            female36: false,
            female46: false,
            female56: false,
            female66: false

        };

        $scope.removeDependent = function (dependent) {
            var dependentsRows = $scope.formDefinition[5].fields[0][1].dependents;
            var index = dependentsRows.indexOf(dependent);
            dependentsRows.splice(index, 1);
        }

        $scope.addDependent = function () {
            var dependentsRows = $scope.formDefinition[5].fields[0][1].dependents;
            dependentsRows.push({birthyear: '', inhouse: false, inschool: false})
        }

        //Post the Form
        $scope.submitForm = function () {
            var allRequiredFieldsFilled = true;
            var emptyFields = [];
            var data = {};
            var url = "/api/createstudent";

            $("#submit-button").prop("disabled", true);

            $scope.formDefinition.forEach(function (element, index, array) {

                    element.fields.forEach(function (element, index, array) {

                        element.forEach(function (element, index, array) {
                            if (element.class) {
                                if ((element.class).includes('required')) {
                                    if (!element.value) {
                                        allRequiredFieldsFilled = false;
                                        emptyFields.push(element.placeholder);
                                    }
                                }
                            }
                            if (element.name == "dependentTable") {
                                var arr = [];
                                element.dependents.forEach(function (element, index, array) {
                                    arr.push(element)
                                });

                                data.dependents = arr;
                            }
                            data[element.name] = element.value;
                        });

                    });

                }
            );

            data.availabilityTimes = $scope.availabilityTimes;
            data.tutorPreferences = $scope.tutorPreferences;
            if (allRequiredFieldsFilled) {
              $http({
                  method: 'POST',
                  url: url,
                  data: data
              })
                  .success(function(data, status) {
                      $window.location.href = '/dashboard';
                  })
                  .error(function(data, status) {
                      popMessageModal('Error',"Request Failed. Please Contact your System Administrator.",'#messageModal');
                      $("#submit-button").prop("disabled",false);
                  });
            } else {
                var errormsg = '';
                emptyFields.forEach(function (field) {
                    errormsg += '<li>' + field + '</li>';
                });
                errormsg = "<p><em><strong>Please fill out the following requred fields and try again:</strong></em><ul>" + errormsg + '</ul>';
                popMessageModal('Error', errormsg, '#messageModal');
                $("#submit-button").prop("disabled", false);
            }
        };
    });
