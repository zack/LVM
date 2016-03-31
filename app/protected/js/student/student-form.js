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
					{name: 'meetatpl', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Can you meet at the Public Library?'},
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
					{name: 'readtoyou', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Did they read to you?'},
					{name: 'schoolattended', class: 'col-md-9', value: '', type: 'text', trim: true, placeholder: 'Where did you attend school?'},
					{name: 'lastgradecompleted', class: 'col-md-3', value: '', type: 'dropdown', options: ['5 or below', '6', '7', '8', '9', '10', '11', '12'], placeholder: 'Grade Completed:'},
					{name: 'completeddate', class: 'col-md-3', value: '', type: 'date', trim: true, placeholder: 'Completion Date:'},
					{name: 'whatwasschoollike', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'What was school like? When did you realize reading was difficult?'},
					{name: 'tutoredbefore', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Are you now/were you ever in a reading/tutoring program? (If yes, where and when, and what did you like or dislike about your experience?)'},
					{name: 'howwillyourlifeimprove', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'How will your life be different when your reading and writing improve?'},
				],
				]
			},
     		{
                id: 'branchinfo',
                name: 'Branch Information',
                fields: [
                [
				 {name: 'occupation', class: 'col-md-6', value: '', type: 'text', trim: true, placeholder: 'Occupation:'},
				  {name: 'employer', class: 'col-md-6', value: '', type: 'text', trim: true, placeholder: 'Employer:'},
				   {name: 'city', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'City/Town'},
				    {name: 'fulltime', class: 'col-md-2', value: '', type: 'checkbox', trim: true, placeholder: 'Full-Time'},
				     {name: 'partime', class: 'col-md-2', value: '', type: 'checkbox', trim: true, placeholder: 'Part-Time'},
				      {name: 'multiplejobs', class: 'col-md-2', value: '', type: 'checkbox', trim: true, placeholder: 'Multiple Jobs?'},
				       {name: 'temporaryjobs', class: 'col-md-2', value: '', type: 'checkbox', trim: true, placeholder: 'Temporary Jobs(s)?'},
				        {name: 'recentlayoff', class: 'col-md-6', value: '', type: 'boolean', trim: true, placeholder: 'Recent Layoff?'},
				         {name: 'concernlayoff', class: 'col-md-6', value: '', type: 'boolean', trim: true, placeholder: 'Concern Re: Recent Layoff?'},
				          {name: 'tafdc', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Public Assistance: Transitional Aid to Families with Dependent Children?'},
				           {name: 'eaedc', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Public Assistance: Emergency Assistance to Elderly, Disabled and Children?'},
				            {name: 'snap', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Public Assistance: Supplemental Nutrition Assistance Program or Food Stamps?'},
				             {name: 'ea', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Public Assistance: Emergency Assistance?'},
				              {name: 'ssi', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Public Assistance: Supplimental Security Income?'},
				               {name: 'wic', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Public Assistance: Women, Infants, and Childrens Programs?'},
				                {name: 'otherpublicassistance', class: 'col-md-3', value: '', type: 'text', trim: true, placeholder: 'Other:'},
				                 {name: 'workexperience', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Tell me about your work experience (Job Tittles(s) and duration of employment, what job skills do you have; What did you like or dislike about past jobs?):'},
				                  {name: 'jobtraining', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Have you attended any job-related training or earned any job-related certificates, licenses, etc? (If yes, what kind, where, and when?'}

				],
                ]
		    },
            {
                id: 'goals',
                name: 'Goals',
                fields: [
                [
                {name: 'whylitval', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Is there a special reason you are seeking help now? What goals would you like to work towards (E.G, GED, Driver\'s license, Help kids with homework, Get a better job) '},
                 {name: 'anychallanges', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Are there any factors that you think will make it especially challanging for you to reach your goals? (Housing, Health, Work, Personal or Family Issues?)'},
                  {name: 'vaktlearningstrengths', class: 'col-md-6', value: '', type: 'text', trim: true, placeholder: 'V A K T Learning Strengths:'},
                   {name: 'hobbies', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Hobbies (i.e Movies, Exercise, Gardening), Interests and Activities/Community Engagement:'},
                    {name: 'whatareyougoodat', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'What are you good at? What do you enjoy doing?'},
                     {name: 'readinginterests', class: 'col-md-6', value: '', type: 'text', trim: true, placeholder: 'Things/Topics interested in reading:'},
                      {name: 'anyotherinfo', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Is there anything else you would like us to know about you?'}

                ],
                ]
            },
            {
                id: 'computerskills',
                name: 'Computer Skills',
                fields: [
                [
                {name: 'havecomputer', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you have a computer at home?'},
                {name: 'usesmartphone', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you use a smart phone?'},
                {name: 'usecomputer', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you use a computer at home?'},
                {name: 'useemail', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you use email?'},
                {name: 'usecomputeratlibrary', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you use a computer at the library?'},
                {name: 'useinternet', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you use the Internet?'},
                {name: 'usecomputeratwork', class: 'col-md-3', value: '', type: 'boolean', trim: true, placeholder: 'Do you use a computer at work?'}
				],
                ]
            },
			{
                id: 'disabilitiesandaccommodations',
                name: 'Disabilities and Accommodations',
                fields: [
                [
				{name: 'understanddisclosure', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Does the Student understand that He/She is not required to disclose a disability?'},
				{name: 'wishtodisclose', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Does the Student wish to disclose a disability?'},
				{name: 'understandaccommodations', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Does the student understand that self-disclosing a disability makes him/her eligible for reasonable accommoations?'},
				{name: 'requestanyspecific', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'If Yes to #3, Does the student wish to request any specific accomodations? If yes, Please explain below in the notes.'},
				{name: 'intervierwerobservations', class: 'col-md-12', value: '', type: 'boolean', trim: true, placeholder: 'Does the interviewer observe anything?'},
				{name: 'explainobservations', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'If Yes, Explain below.'}
                ],
                ]
            },
			{
                id: 'testresults',
                name: 'Test Results',
                fields: [
                [
                {name: 'explainobservations', class: 'col-md-6', value: '', type: 'text', trim: true, placeholder: 'TABE Score:'},
                {name: 'explainobservations', class: 'col-md-6', value: '', type: 'date', trim: true, placeholder: 'TABE Date:'},
                {name: 'explainobservations', class: 'col-md-6', value: '', type: 'text', trim: true, placeholder: 'MAPT Score:'},
                {name: 'explainobservations', class: 'col-md-6', value: '', type: 'date', trim: true, placeholder: 'MAPT Date:'},


                ],
                ]
            },
			{
                id: 'interviewerscomments',
                name: 'Interviewer\'s Comments/Other Information',
                fields: [
                [
                {name: 'explainobservations', class: 'col-md-12', value: '', type: 'text', trim: true, placeholder: 'Any other comments?:'}

                ],
                ]
            },
            {
                id: 'branchinfo',
                name: 'Branch Information',
                fields: [
                [
				{name: 'affiliate', class: 'col-md-12', value: '', type: 'dropdown', options: ['boston', 'Project Lighthouse', 'Fitchburg', 'Framingham', 'Lowell', 'Norwood', 'Orange-Athol', 'Pittsfield', 'Quaboag Valley', 'Quincy', 'Tri Community', 'Soughton', 'Worcester'], placeholder:'Affiliate Site'}
                ],
                ]
            }
        ];

        $scope.gatherValues = function () {
            return 5;
        };
    });