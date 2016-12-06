/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 *
 * Created by: Evan Noyes
 */

'use strict';

var _ = require('underscore');

module.exports = function (database, logging, statusCodes) {
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
                '         AND p.doeOccupation = o.id'; +
                ' ORDER BY ' +
                '         st.dateModified ASC';
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
            var doeID = Math.floor((Math.random() * 100000) + 1); // ----------- PLACEHOLDER -----------
            var lastName = req.body.lastName;
            var firstName = req.body.firstName;
            var intakeDate = today.toISOString().slice(0, 10);
            var dob = req.body.dateOfBirth;
            var gender = req.body.gender;
            var primaryServiceType = 'ESOL'; // ----------- PLACEHOLDER -----------
            var status = 'Current';
            var address1 = req.body.address1;
            var address2 = req.body.address2;
            var city = req.body.city;
            var state = req.body.state;
            var zip = req.body.zip;
            var zip4 = 1;
            var homePhone = req.body.homePhone;
            var workPhone = req.body.workPhone;
            var extension = null; // ----------- PLACEHOLDER -----------
            var cellPhone = req.body.cellPhone;
            var email = req.body.email;
            var nativeLanguage = req.body.nativelanguage;
            var studentEthnicity = req.body.race;
            var hispanicOrLatino = req.body.ishispanic;
            var doeReferral = req.body.doereferal;
            var lvmReferral = req.body.LVM_Referal;
            var doeEmployStatus = 1; // ----------- PLACEHOLDER -----------
            var doeOccupation =1; // ----------- PLACEHOLDER -----------
            var dateAdded = today.toISOString().slice(0, 10);
            var dateModified = today.toISOString().slice(0, 10);

            var smarttID = 0; // ----------- PLACEHOLDER -----------
            var countryOfOrigin = req.body.countryoforigin;
            var singleParent = req.body.singleparent;
            var learningDisability = req.body.wishtodisclose;
            var physicalDisability = req.body.wishtodisclose; // ----------- PLACEHOLDER -----------
            var emergencyContactName = req.body.emergencyContactName;
            var emergencyContactNumber = req.body.emergencyContactNumber;

            var okayToMail = req.body.okayToMail;
            var okayToEmail = req.body.okayToEmail;
            var cellMsgOk = req.body.okayToCallCell;
            var homeMsgOk = req.body.okayToCallHome;
            var workMsgOk = req.body.okayToCallWork;
            var altMsgOk = req.body.okayToCallAlternate;
            var cellLVMOk = req.body.okayToCallCellLVM;
            var homeLVMOk = req.body.okayToCallHomeLVM;
            var workLVMOk = req.body.okayToCallWorkLVM;
            var altLVMOk = req.body.okayToCallAlternateLVM;

            var mTeen = req.body.tutorPreferences.maleTeen;
            var fTeen = req.body.tutorPreferences.femaleTeen;
            var m20 = req.body.tutorPreferences.male20;
            var f20 = req.body.tutorPreferences.female20;
            var m26 = req.body.tutorPreferences.male26;
            var f26 = req.body.tutorPreferences.female26;
            var m36 = req.body.tutorPreferences.male36;
            var f36 = req.body.tutorPreferences.female36;
            var m46 = req.body.tutorPreferences.male46;
            var f46 = req.body.tutorPreferences.female46;
            var m66 = req.body.tutorPreferences.male56 | req.body.tutorPreferences.male66;
            var f66 = req.body.tutorPreferences.female56 | req.body.tutorPreferences.female66;
            var preferenceComments = req.body.preferencecomments;
            var publicLibrary = req.body.meetatpl;
            var otherLocation = req.body.alt_meeting_location;

            var TFADC = req.body.tafdc;
            var EAEDC = req.body.eaedc;
            var foodStamps = req.body.snap;
            var EA = req.body.ea;
            var SSI = req.body.ssi;
            var noPA = false;
            var otherPA = req.body.otherpublicassistance;

            var testDate = req.body.tabedate;
            var testType = 1;
            var testResult = req.body.tabescore;
            var fedLevel = 1;
            var fedType = 1;

            var studentGoal = 1;//req.body.whylitval;
            var dateGoalSet = today.toISOString().slice(0, 10);
            var dateGoalMet = null;
            var mainGoal = true;

            var employer = req.body.employer;
            var cityTown = req.body.city;
            var fullTime = req.body.fulltime;
            var partTime = req.body.partime;
            var multipleJobs = req.body.multiplejobs;
            var tempJobs = req.body.temporaryjobs;
            var recentLayoff = req.body.recentlayoff;
            var concernReLayoff = req.body.concernlayoff;

            var haveComputerAtHome = req.body.havecomputer;
            var useComputerAtHome = req.body.usecomputer;
            var useComputerAtLibrary = req.body.usecomputeratlibrary;
            var useComputerAtWork = req.body.usecomputeratwork;
            var useSmartphone = req.body.usesmartphone;
            var useEmail = req.body.useemail;
            var useInternet = req.body.useinternet;

            var notRequiredToDisclose = req.body.understanddisclosure;
            var wishToDisclose = req.body.wishtodisclose;
            var understandEligibleForAccommodations = req.body.understandaccommodations;
            var wishToRequestAccommodations = req.body.requestanyspecific;
            var disabilityNotes = req.body.explainobservations;

            var isTestData = 1;

            var params = [affiliate, doeID, lastName, firstName, intakeDate,
                dob, gender, primaryServiceType, status, address1,
                address2, city, state, zip, zip4, homePhone,
                workPhone, extension, cellPhone, email, nativeLanguage,
                studentEthnicity, hispanicOrLatino, doeReferral, lvmReferral, doeEmployStatus,
                doeOccupation, dateAdded, dateModified, smarttID, countryOfOrigin,
                singleParent, learningDisability, physicalDisability, emergencyContactName, emergencyContactNumber,
                okayToMail, okayToEmail, cellMsgOk, homeMsgOk, workMsgOk,
                altMsgOk, cellLVMOk, homeLVMOk, workLVMOk, altLVMOk,
                mTeen, fTeen, m20, f20, m26,
                f26, m36, f36, m46, f46,
                m66, f66, preferenceComments, publicLibrary, otherLocation,
                TFADC, EAEDC, foodStamps, EA, SSI,
                noPA, otherPA, testDate, testType, testResult,
                fedLevel, fedType, studentGoal, dateGoalSet, dateGoalMet,
                mainGoal, employer, cityTown, fullTime, partTime,
                multipleJobs, tempJobs, recentLayoff, concernReLayoff, haveComputerAtHome,
                useComputerAtHome, useComputerAtLibrary, useComputerAtWork, useSmartphone, useEmail,
                useInternet, notRequiredToDisclose, wishToDisclose, understandEligibleForAccommodations, wishToRequestAccommodations,
                disabilityNotes, isTestData];



            var sql =
                "SET @PersonID = 0;\n" +
                "SET @StudentID = 0;\n" +
                "CALL addStudent(?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,?,?," +
                "?,?,?,@PersonID,@StudentID);\n" +
                "SELECT @PersonID as inout_p, @StudentID as inout_s;";


            var output;
            var personID;
            var studentID;

            database.query(sql, params, function(err, rows, fields) {
                if (err) throw err;
                console.log(rows);
                output = rows;
                personID = output[3][0].inout_p;
                studentID = output[3][0].inout_s;
                console.log("DONE");
                console.log(output);

                var a_sql = "CALL updatePersonAvailability(?,?,?,?,?,?,?);";

                var at_to_day = {monMorn: 1, tueMorn: 2, wedMorn: 3, thurMorn: 4, friMorn: 5, satMorn: 6, sunMorn: 0,
                    monAfternoon: 1, tueAfternoon: 2, wedAfternoon: 3, thurAfternoon: 4, friAfternoon: 5, satAfternoon: 6, sunAfternoon: 0,
                    monEve: 1, tueEve: 2, wedEve: 3, thurEve: 4, friEve: 5, satEve: 6, sunEve: 0 };

                var at_to_start = {monMorn: 8, tueMorn: 8, wedMorn: 8, thurMorn: 8, friMorn: 8, satMorn: 8, sunMorn: 8,
                    monAfternoon: 12, tueAfternoon: 12, wedAfternoon: 12, thurAfternoon: 12, friAfternoon: 12, satAfternoon: 12, sunAfternoon: 12,
                    monEve: 17, tueEve: 17, wedEve: 17, thurEve: 17, friEve: 17, satEve: 17, sunEve: 17 };

                var at_to_end = {monMorn: 12, tueMorn: 12, wedMorn: 12, thurMorn: 12, friMorn: 12, satMorn: 12, sunMorn: 12,
                    monAfternoon: 17, tueAfternoon: 17, wedAfternoon: 17, thurAfternoon: 17, friAfternoon: 17, satAfternoon: 17, sunAfternoon: 17,
                    monEve: 21, tueEve: 21, wedEve: 21, thurEve: 21, friEve: 21, satEve: 21, sunEve: 21 };

                var a_day, a_startTime, a_endTime, a_params;

                var availability = req.body.availabilityTimes;
                for (var key in availability) {
                    if (availability.hasOwnProperty(key)) {

                        if (availability[key] == true) {
                            a_day = at_to_day[key];
                            a_startTime = at_to_start[key];
                            a_endTime = at_to_end[key];

                            a_params = [personID, a_day, a_startTime, a_endTime, dateAdded, dateModified, isTestData];

                            database.query(a_sql, a_params, function(err, rows, fields) {
                                if (err) throw err;
                            });
                        }
                    }
                }

                var dependents = req.body.dependents;
                var d_sql = "CALL updateStudentDependentsTable(?,?,?,?,?,?,?,?);";

                var d_yob, d_inschool, d_samehouse, d_params;

                dependents.forEach(function (element, index, array) {

                    d_yob = element.birthyear;
                    d_inschool = element.inschool;
                    d_samehouse = element.inhouse;

                    d_params = [studentID, d_yob, d_inschool, d_samehouse, "", dateAdded, dateModified, isTestData];

                    database.query(d_sql, d_params, function(err, rows, fields) {
                        if (err) throw err;
                    });
                });
                return res.status(200);
            });
            res.json()
            console.log("DONE")
        },

        autocomplete: function (req, res, next) {
            if (req.params.name.length < 3) { return res.json([]); }

            var queryValue = req.params.name + '%'; // add wildcard on end

            database.query({
                sql: 'SELECT p.id as pid, st.id as sid, CONCAT(p.firstName, \' \', p.lastName) as name, ' +
                '       p.primaryServiceType, s.name as site ' +
                'FROM Student st, Person p, Sites s ' +
                'WHERE st.person = p.id and ' +
                '      p.site = s.id and ' +
                '      CONCAT(firstName, \' \', lastName) like ? ' +
                    // If not an admin (affiliate = 0), then specify the affiliate's site in the query to limit results
                (req.session.user.branch ? ' and p.site = ? ' : ' ') +
                'LIMIT 10;',
                values: ['%' + queryValue + '%', req.session.user.branch]
            }, function (error, results, fields) {
                if (error) {
                    logging.error('student autocomplete failed', {
                        name: req.params.name,
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).json([]);
                }
                return res.json(results);
            });
        }
    };

};
