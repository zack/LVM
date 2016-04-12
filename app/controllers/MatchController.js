/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var _ = require('underscore');

module.exports = function (logging, database, statusCodes) {
    var cleanseData = function (data) {
        delete data.isTestData;
        return data;
    };
    
    return {
        getMatches: function (req, res, next) {
            var status = req.query.status ? req.query.status : 'Current',
                sql = 'SELECT m.*, p1.firstName as studentFirstName, p1.lastName as studentLastName ' + 
                     '       p2.firstName as tutorFirstName, p2.lastName as tutorLastName, site.name as siteName ' +
                     'FROM Matches m, Student s, Tutor t, Person p1, Person p2, Sites site' + 
                     'WHERE m.student = s.id and ' +
                     '      m.tutor = t.id and ' +
                     '      m.site = site.id and ' +
                     '      p1.id = s.person and ' +
                     '      p2.id = t.person and ' +
                     '      m.status = ? ' +
                     (req.session.user.branch ? ' and m.site = ?;' : ';');
            
            database.query({
                sql: sql,
                values: [status, req.session.user.branch]
            }, function (error, results, fields) {
                if (error) { 
                    logging.error('error fetching matches', {
                        status: req.query.status,
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
        
        lookupMatchesForPerson: function (req, res, next) {
            if (!req.params.pid || !_.isNumber(req.params.pid)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('Not all required fields are present.');
            }
            
            var sql = 'SELECT m.*, p1.firstName as studentFirstName, p1.lastName as studentLastName ' + 
                     '       p2.firstName as tutorFirstName, p2.lastName as tutorLastName, site.name as siteName ' +
                     'FROM Matches m, Student s, Tutor t, Person p1, Person p2, Sites site' + 
                     'WHERE m.student = s.id and ' +
                     '      m.tutor = t.id and ' +
                     '      m.site = site.id and ' +
                     '      p1.id = s.person and ' +
                     '      p2.id = t.person and ' +
                     '      (p1.id = ? or p2.id = ?) ' +
                     (req.session.user.branch ? ' and m.site = ? ' : '');
            
            database.query({
                sql: sql,
                values: [req.params.pid, req.params.pid, req.session.user.branch]
            }, function (error, results, fields) {
                if (error) { 
                    logging.error('error fetching matches by person id', {
                        pid: req.params.pid,
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
        
        addMatching: function (req, res, next) {
            // Validation
            
            // Database Query
        },
        
        dissolveMatching: function (req, res, next) {
            // Validation
            
            // Database Query
        }
    };
};