/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 */

'use strict';

angular.module('lvmApp')
    .controller('FormController', function($scope) {
        var form = this;

        form.formDefinition = [
            {
                id: 'studentinfo',
                name: 'Student Information',
                fields: [
                    [
                        {name: 'firstName', class: 'col-md-3', value: '', type: 'text', trim: true, placeholder: 'First Name'},
                        {name: 'lastName', class: 'col-md-3', value: '', type: 'text', trim: true, placeholder: 'Last Name'},
                        {name: 'dateOfBirth', class: 'col-md-3', value: '', type: 'date', trim: true, placeholder: 'Date of Birth'},
                        {name: 'gender', class: 'col-md-3', value: '', type: 'dropdown', options: ['Male', 'Female'], placeholder: 'Gender'}
                    ],

                ]
            },
            {
                id: 'contactinfo',
                name: 'Contact Information',
                fields: [
                    [
                        {name: 'address1', type: 'text', trim: true, maxlength: 255, placeholder: 'Address Line 1'},
                        {name: 'address2', type: 'text', trim: true, maxlength: 255, placeholder: 'Address Line 2'}
                    ],
                    [
                        {name: 'city', class: 'col-md-6', type: 'text', trim: true, maxlength: 255, placeholder: 'City'},
                        {name: 'state', class: 'col-md-2', type: 'text', trim: true, maxlength: 2, placeholder: 'State'},
                        {name: 'zip', class: 'col-md-2', type: 'text', trim: true, maxlength: 10, placeholder: 'ZIP Code'},
                        {name: 'okayToMail', class: 'col-md-2', type: 'boolean', placeholder: 'OK To Mail?'}
                    ],
                    [
                        {name: 'email', class: 'col-md-10', type: 'email', trim: true, maxlength: 255, placeholder: 'Email'},
                        {name: 'okayToEmail', class: 'col-md-2', type: 'boolean', placeholder: 'OK To Email?'}
                    ],
                    [
                        {name: 'cellPhone', class: 'col-md-2', type: 'phone', trim: true, maxlength: 10, placeholder: 'Cell Number'},
                        {name: 'okayToCallCell', class: 'col-md-2', type: 'boolean', placeholder: 'Message OK?'},
                        {name: 'okayToCallCellLVM', class: 'col-md-2', type: 'boolean', placeholder: 'LVM OK?'},
                        {name: 'homePhone', class: 'col-md-2', type: 'phone', trim: true, maxlength: 10, placeholder: 'Home Number'},
                        {name: 'okayToCallHome', class: 'col-md-2', type: 'boolean', placeholder: 'Message OK?'},
                        {name: 'okayToCallHomeLVM', class: 'col-md-2', type: 'boolean', placeholder: 'LVM OK?'}
                    ],
                    [
                        {name: 'workPhone', class: 'col-md-2', type: 'phone', trim: true, maxlength: 10, placeholder: 'Work Number'},
                        {name: 'okayToCallWork', class: 'col-md-2', type: 'boolean', placeholder: 'Message OK?'},
                        {name: 'okayToCallWorkLVM', class: 'col-md-2', type: 'boolean', placeholder: 'LVM OK?'},
                        {name: 'alternatePhone', class: 'col-md-2', type: 'phone', trim: true, maxlength: 10, placeholder: 'Alternate Number'},
                        {name: 'okayToCallAlternate', class: 'col-md-2', type: 'boolean', placeholder: 'Message OK?'},
                        {name: 'okayToCallAlternateLVM', class: 'col-md-2', type: 'boolean', placeholder: 'LVM OK?'},
                    ],
                    [
                        {name: 'emergencyContactName', class: 'col-md-8', type: 'text', trim: true, maxlength: 255, placeholder: 'Emergency Contact (Name)'},
                        {name: 'emergencyContactNumber', class: 'col-md-4', type: 'phone', trim: true, placeholder: 'Emergency Contact (Phone)'},
                    ],
                    [
                        {name: 'howDidYouHear', type: 'text', trim: true, maxlength: 255, placeholder: 'How did you hear about LVM?'},
                    ],
                    [
                        {name: 'whyDidYouChoose', type: 'text', trim: true, maxlength: 255, placeholder: 'Why did you choose LVM?'},
                    ],
                ]
            },
            {
                id: 'demographics',
                name: 'Demographics',
                fields: [

                ]
            },
            {
                id: 'goals',
                name: 'Goals',
                fields: [

                ]
            },
            {
                id: 'dependents',
                name: 'Dependents',
                fields: [

                ]
            },
            {
                id: 'branchinfo',
                name: 'Branch Information',
                fields: [

                ]
            }
        ];
        
        $scope.gatherValues = function () {
            return 5;
        };
    });