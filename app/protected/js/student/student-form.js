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
                	[
                		{name: 'race', class: 'col-md-4', value: '', type: 'dropdown', options: ['American Indian','Native Hawaiian/Pacific Islander','Asian','White','Black or African American','Hispanic/Latino'], placeholder: 'Race'},
                		{name: 'countryoforigin', class: 'col-md-4', value:'', type:'dropdown', options: ['USA', 'Afghanistan','Albania','Algeria','American Samoa','Andorra','Angola','Antigua and Barbuda','Argentina','Armenia','Australia','Austria','Azerbaijan',
                		'Bahamas','Bahrain','Bangladesh','Barbados','Belarus','Belgium','Belize','Benin','Bermuda','Bhutan','Bolivia','Bosnia and Herzegovina','Botswana','Brazil','Brunei Darussalam','Bulgaria','Burkina Faso','Burundi','Cambodia','Cameroon','Canada','Cape Verde','Central African Republic','Chad','Chile','China','Colombia','Comoros','Congo','Cook Islands','Costa Rica',
						'Cote d\'Ivoire','Croatia','Cuba','Cyprus','Czech Republic','Dem.Rep.of the Congo','Denmark','Djibouti','Dominica','Dominican Republic','East Timor','Ecuador','Egypt','El Salvador','Equatorial Guinea','Eritrea','Estonia','Ethiopia','Fiji',
						'Finland','France','French Guiana','French Polynesia','Gabon','Gambia','Georgia','Germany','Ghana','Gibraltar','Greece','Grenada','Guadeloupe','Guam','Guatemala','Guinea','Guinea-Bissau','Guyana','Haiti','Honduras','Hong Kong S A R','Hungary',
						'Iceland','India','Indonesia','Iran (Islamic Rep. Of)','Iraq','Ireland','Israel','Italy','Jamaica','Japan','Jordan','Kazakhstan','Kenya','Kiribati','Korea, Dem.People\'s Rep.','Korea, Republic of','Kuwait','Kyrgyzstan','Lao People\'s Dem. Rep.','Latvia',
						'Lebanon','Lesotho','Liberia','Libyan Arab Jamahiriya','Liechtenstein','Lithuania','Luxembourg','Macao S A R','Madagascar','Malawi','Malaysia','Maldives','Mali','Malta','Marshall Islands','Martinique','Mauritania','Mauritius','Mexico','Micronesia, Fed. States of',
						'Monaco','Mongolia','Morocco','Mozambique','Myanmar','Namibia','Nauru','Nepal','Netherlands','Netherlands Antilles','New Caledonia','New Zealand','Nicaragua','Niger','Nigeria','Northern Mariana Islands','Norway','Occ. Palestinian Territory','Oman',
						'Pakistan','Palau','Panama','Papua New Guinea','Paraguay','Peru','Philippines','Poland','Portugal','Puerto Rico','Qatar','Republic of Moldova','Reunion','Romania','Russian Federation','Rwanda','Saint Kitts and Nevis','Saint Lucia','Saint Vincent / Grenadines','Samoa',
						'San Marino','Sao Tome and Principe','Saudi Arabia','Senegal','Seychelles','Sierra Leone','Singapore','Slovakia','Slovenia','Solomon Islands','Somalia','South Africa','Spain','Sri Lanka','Sudan','Suriname','Swaziland','Sweden','Switzerland','Syrian Arab Republic',
						'Tajikistan','Thailand','The FYR of Macedonia','Togo','Tonga','Trinidad and Tobago','Tunisia','Turkey','Turkmenistan','Tuvalu','U.S. Virgin Islands','Uganda','Ukraine','United Arab Emirates','United Kingdom','United Rep. Of Tanzania','Uruguay',
						'Uzbekistan','Vanuatu','Venezuela','Viet Nam','Western Sahara','Yemen','Yugoslavia','Zambia','Zimbabwe'], placeholder: 'Country of Origin'},
                		{name: 'nativelanguage', class: 'col-md-3', value:'', type: 'dropdown', options: ['English','Albanian','Arabic','Cambodian','CapeVerdeanCreole','Chinese - Cantonese','Chinese - Mandarin','Chinese - Toisanese','Farsi','French','Gaelic','German','Greek','Haitian Creole','Hindi','Italian','Japanese',
                		'Korean','Laotian','Lebanese','Polish','Portuguese','Russian','Spanish','Syrian','Turkish','Urdu','Vietnamese','Other'], placeholder: 'Native Language'}
                		],
                ]
			},
			{
                id: 'timesavailable',
                name: 'Times',
                fields: [
                [
                	{name: 'available', type: 'timetable'}
                ],
                ]
            },
            {
				id: 'tutorpreference',
				name: 'Tutor Preference',
				fields: [
				[
					{name: 'preference', type: 'preferenceTable'},
					{name: 'preferencecomments', type: 'text', placeholder:'Comments:'},
					{name: 'meetatbpl', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Can you meet at BPL-Coply?'},
					{name: 'if not, where?', class: 'col-md-9', value: '', type: 'text', trim:true, placeholder: 'If not, where?'}
				],
				]
			},
			{
				id: 'family',
				name: 'Family Information',
				fields: [
				[
					{name: 'haschildren', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you have any Children?'},
					{name: 'dependantTable', type: 'dependantTable'},
					{name: 'singleparent', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Are you a single parent?'},
					{name: 'familycomments', type: 'text', placeholder:'Comments:'}
				],
				]
			},
			{
				id: 'education',
				name: 'Educational Experience',
				fields: [
				[
					{name: 'parentsread', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do your parents read?'},
					{name: 'parentsread', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do your parents read?'},
				],
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