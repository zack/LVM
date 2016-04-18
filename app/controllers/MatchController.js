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
    
    var controller = {
        getMatches: function (req, res, next) {
            var status = req.query.status ? req.query.status : 'Current',
                sql = 'SELECT m.*, p1.firstName as studentFirstName, p1.lastName as studentLastName, ' + 
                     '       p2.firstName as tutorFirstName, p2.lastName as tutorLastName, site.name as siteName ' +
                     'FROM Matches m, Student s, Tutor t, Person p1, Person p2, Sites site ' + 
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
                res.json(results);
            });
        },
        
        addOrUpdate: function (req, res, next) {
            if (!req.params.id) {
                return controller.addMatch(req, res, next);
            }
            return controller.updateMatch(req, res, next);
        },
        
        addMatch: function (req, res, next) {
            var match = req.body;
            if (_.isUndefined(req.session.user.branch) || !match.doeMatchID || !match.status || !match.tutor 
                || !match.student || !match.matchStart || _.isUndefined(match.onHold)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('Not all required fields are present.');
            }
            
            var sql = 'CALL updateMatchesTable(?,?,?,?,?,?,?,?,?,?,?);',
                d = new Date();
                
            match.matchEnd = _.isUndefined(match.matchEnd) ? null : match.matchEnd;
            
            database.query({
                sql: sql,
                values: [req.session.user.branch || 5, match.doeMatchID, match.status, match.tutor, match.student, match.matchStart, match.matchEnd, match.onHold, d, d, 0]
            }, function (error, results, fields) {
                if (error) {
                    console.log(error, error.stack);
                    logging.error('error adding match', {
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred creating the match.');
                }
                results = _.map(results, cleanseData);
                if (results.length === 1) {
                    results = results[0];
                }
                res.json(results);
            });
        },
        
        updateMatch: function (req, res, next) {
            if (!req.params.id || !_.isString(req.params.id)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('Not all required fields are present.');
            }
            
            var sql = 'UPDATE Matches ' +
                      'SET site=?, doeMatchID=?, status=?, matchStart=?, matchEnd=?, onHold=?, dateModified=? ' +
                      'WHERE id=? ' +
                      (req.session.user.branch ? ' and m.site = ?;' : ';'),
                match = req.body,
                d = new Date();
            console.log(sql);
            database.query({
                sql: sql,
                values: [match.site, match.doeMatchID, match.status, match.matchStart, match.matchEnd, match.onHold, d, match.id, req.session.user.branch]
            }, function (error, results, fields) {
                if (error) { 
                    logging.error('error updating match by id', {
                        id: req.params.id,
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred updating the match.');
                }
                results = _.map(results, cleanseData);
                if (results.length === 1) {
                    results = results[0];
                }
                res.json(results);
            });
        },
        
        dissolveMatch: function (req, res, next) {
            if (!req.params.id || !_.isString(req.params.id)) {
                return res.status(statusCodes.BAD_REQUEST_STATUS).send('Not all required fields are present.');
            }
            
            var sql = 'UPDATE Matches ' +
                      "SET status='Dissolved', matchEnd=?, dateModified=? " +
                      'WHERE id=? ' +
                      (req.session.user.branch ? ' and m.site = ?;' : ';'),
                endDate = new Date();
                
            database.query({
                sql: sql,
                values: [endDate, endDate, req.params.id, req.session.user.branch]
            }, function (error, results, fields) {
                if (error) { 
                    logging.error('error dissolving match by id', {
                        id: req.params.id,
                        user: req.session.user.username,
                        error: error
                    });
                    return res.status(statusCodes.INTERNAL_SERVER_ERROR).send('An error occurred dissolving the match.');
                }
                results = _.map(results, cleanseData);
                if (results.length === 1) {
                    results = results[0];
                }
                res.json(results);
            });
        }
    };
    
    return controller;
};