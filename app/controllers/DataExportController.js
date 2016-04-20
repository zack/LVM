/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 *
 * Created by: Michael Rodrigues
 */

'use strict';

module.exports = function (database, logging, statusCodes) {
    var exportQueries = {
        student: 'SELECT * FROM Person p, Student s, Sites si WHERE p.id = s.person and si.id = p.site;',
        tutor: 'SELECT * FROM Person p, Tutor t, Sites si WHERE p.id = t.person and si.id = p.site;',
        matches: 'SELECT * FROM Matches m, Sites si, Student s, Tutor t, Person p1, Person p2 WHERE m.site = si.id and m.student = s.id and m.tutor = t.id and p1.id = s.person and p2.id = t.person;'
    };
    
    return {
        exportStudents: function (req, res, next) {
            res.set({
                'Content-Description': 'File Transfer',
                'Content-Type': 'application/json',
                'Content-Disposition': 'attachment; filename=students.json',
            });
            
            database.query({
                sql: exportQueries.student,
                values: []
            }, function(error, results, fields) {
                if (error) {
                    logging.error('error exporting students', {
                        name: req.params.name,
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).json([new Error('An error occurred.')]);
                }
                if (results.length === 1) {
                    results = results[0];
                }
                res.json(results);
            });
        },
        
        exportTutors: function (req, res, next) {
            res.set({
                'Content-Description': 'File Transfer',
                'Content-Type': 'application/json',
                'Content-Disposition': 'attachment; filename=tutors.json',
            });
            
            database.query({
                sql: exportQueries.tutor,
                values: []
            }, function(error, results, fields) {
                if (error) {
                    logging.error('error exporting tutors', {
                        name: req.params.name,
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).json([new Error('An error occurred.')]);
                }
                if (results.length === 1) {
                    results = results[0];
                }
                res.json(results);
            });
        },
        
        exportMatches: function (req, res, next) {
            res.set({
                'Content-Description': 'File Transfer',
                'Content-Type': 'application/json',
                'Content-Disposition': 'attachment; filename=matches.json',
            });
            
            database.query({
                sql: exportQueries.matches,
                values: []
            }, function(error, results, fields) {
                if (error) {
                    logging.error('error exporting matches', {
                        name: req.params.name,
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).json([new Error('An error occurred.')]);
                }
                if (results.length === 1) {
                    results = results[0];
                }
                res.json(results);
            });
        }
    };
};
