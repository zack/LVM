/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 *
 * Created by: Evan Noyes
 */

'use strict';

var _ = require('underscore');

module.exports = function(database, statusCodes) {
    var cleanseData = function(data) {
        delete data.isTestData;
        return data;
    };

    return {
        getStudent: function(req, res, next) {
            var query = 'SELECT ' +
                '     st.*,' +
                '     p.*,' +
                '     p.id AS pid,' +
                '     st.id AS stid,' +
                '     s.name AS siteName,' +
                '     nl.language AS languageName,' +
                '     e.ethnicity AS ethnicity,' +
                '     r.referral AS doeReferralName,' +
                '     l.referral AS lvmReferralName,' +
                '     es.estatus AS employmentStatusName,' +
                '     o.occupation AS doeOccupationName' +
                ' FROM ' +
                '     Person p,' +
                '     Student st,' +
                '     Sites s,' +
                '     DOENativeLanguage nl,' +
                '     Ethnicity e,' +
                '     DOEReferral r,' +
                '     LVMReferral l,' +
                '     DOEOccupation o,' +
                '     EmploymentStatus es' +
                ' WHERE ' +
                '     p.id = st.person AND p.site = s.id' +
                '         AND p.nativeLanguage = nl.id' +
                '         AND p.ethnicity = e.id' +
                '         AND p.doeReferral = r.id' +
                '         AND p.lvmReferral = l.id' +
                '         AND p.doeEmployStatus = es.id' +
                '         AND p.doeOccupation = o.id';
            var queryVals = [];

            if (req.params.id) {
                query += '      and p.id = ?';
                queryVals.push(req.params.id);
            }

            // If not an admin (affiliate = 0), then specify the affiliate's site in the query to limit results
            if (req.session.user.branch) {
                query += ' and p.site = ? ';
                queryVals.push(req.session.user.branch);
            }

            database.query({
                sql: query,
                values: queryVals
            }, function(error, results, fields) {
                if (error) {
                    logging.error('error fetching tutor', {
                        name: req.params.name,
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).json([null]);
                }
                results = _.map(results, cleanseData);
                if (results.length === 1) {
                    results = results[0];
                }
                res.json(results);
            });
        },

        // Requires: a lot
        createStudent: function(req, res, next) {

            var today = new Date();

            // DATA for stored procedure
            var affiliate = req.body.affiliate;
            var doeID = 0; // ----------- PLACEHOLDER -----------
            var newForFY = 0; // ----------- PLACEHOLDER -----------
            var firstName = req.body.firstName;
            var lastName = req.body.lastName;
            var intakeDate = today.toISOString().slice(0, 10);
            var dob = req.body.dateOfBirth;
            var gender = req.body.gender;
            var primaryServiceType = 'ESOL'; // ----------- PLACEHOLDER -----------
            var address1 = req.body.address1;
            var address2 = req.body.address2;
            var city = req.body.city;
            var state = req.body.state;
            var zip = req.body.zip;
            var zip4 = "";
            var homePhone = req.body.homePhone;
            var workPhone = req.body.workPhone;
            var extension = 0; // ----------- PLACEHOLDER -----------
            var cellPhone = req.body.cellPhone;
            var email = req.body.email;
            var nativeLanguage = req.body.nativeLanguage;
            var ethnicity = req.body.race;
            var doeReferral = ""; // ----------- PLACEHOLDER -----------
            var lvmReferral = ""; // ----------- PLACEHOLDER -----------
            var yearsUS = 0; // ----------- PLACEHOLDER -----------
            var yearsForeign = 0; // ----------- PLACEHOLDER -----------
            var doeEmployStatus = ""; // ----------- PLACEHOLDER -----------
            var doeOccupation = ""; // ----------- PLACEHOLDER -----------
            var dateAdded = today.toISOString().slice(0, 10);
            var dateModified = today.toISOString().slice(0, 10);
            var smarttID = 0; // ----------- PLACEHOLDER -----------
            var okayToCall = req.body.okayToCallCell;
            var okayToMail = req.body.okayToMail;
            var okayToEmail = req.body.okayToEmail;
            var zipCodeID = 0; // ----------- PLACEHOLDER -----------
            var countryOfOrigin = req.body.countryoforigin;
            var timeInJobMonths = 0; // ----------- PLACEHOLDER -----------
            var timeInJobYears = 0; // ----------- PLACEHOLDER -----------
            var publicAssistance = "None"; // ----------- PLACEHOLDER -----------
            var singleParent = req.body.singleparent;
            var learningDisability = req.body.wishtodisclose;
            var physicalDisability = req.body.wishtodisclose; // ----------- PLACEHOLDER -----------
            var mTeen = 0; // ----------- PLACEHOLDER -----------
            var fTeen = 0; // ----------- PLACEHOLDER -----------
            var m20 = 0; // ----------- PLACEHOLDER -----------
            var f20 = 0; // ----------- PLACEHOLDER -----------
            var m26 = 0; // ----------- PLACEHOLDER -----------
            var f26 = 0; // ----------- PLACEHOLDER -----------
            var m36 = 0; // ----------- PLACEHOLDER -----------
            var f36 = 0; // ----------- PLACEHOLDER -----------
            var m46 = 0; // ----------- PLACEHOLDER -----------
            var f46 = 0; // ----------- PLACEHOLDER -----------
            var m66 = 0; // ----------- PLACEHOLDER -----------
            var f66 = 0; // ----------- PLACEHOLDER -----------
            var studentGoal = req.body.whylitval;
            var dateGoalSet = today.toISOString().slice(0, 10);
            var dateGoalMet = null;
            var mainGoal = true;
            var testDate = today.toISOString().slice(0, 10); // ----------- PLACEHOLDER -----------
            var testType = "TABE 7"; // ----------- PLACEHOLDER -----------
            var testResult = ""; // ----------- PLACEHOLDER -----------
            var fedLevel = 0; // ----------- PLACEHOLDER -----------
            var fedType = 0; // ----------- PLACEHOLDER -----------
            var inSchool = 0; // ----------- PLACEHOLDER -----------
            var isTestData = 1;

            var params = [affiliate, doeID, newForFY, lastName, firstName,
                intakeDate, dob, gender, primaryServiceType, status,
                address1, address2, city, state, zip, zip4, homePhone,
                workPhone, extension, cellPhone, email, nativeLanguage,
                ethnicity, doeReferral, lvmReferral, yearsUS, yearsForeign,
                doeEmployStatus, doeOccupation, dateAdded, dateModified,
                smarttID, okayToCall, okayToMail, okayToEmail, zipCodeID,
                countryOfOrigin, timeInJobMonths, timeInJobYears, publicAssistance,
                singleParent, learningDisability, physicalDisability,
                mTeen, fTeen, m20, f20, m26, f26, m36, f36, m46, f46,
                m66, f66, studentGoal, dateGoalSet, dateGoalMet, mainGoal,
                testDate, testType, testResult, fedLevel, fedType, inSchool,
                isTestData
            ];



            var sql = "CALL addStudent(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, " +
                "?, ?, ?, ?, ?, ?)";





            database.connection.query(sql, params, function() {});

        }

    };

};
