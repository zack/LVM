/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var logging = jasmine.createSpyObj('logging', ['info', 'warn', 'error']),
    database = { query: null },
    statusCodes = require('../../app/lib/statusCodes.js')(),
    TutorController = require('../../app/controllers/TutorController.js')(logging, database, statusCodes);

var res,
    next;

var resetSpies = function () {
    res = jasmine.createSpyObj('res', ['status', 'send', 'json', 'redirect']);
    next = jasmine.createSpy('next');
     
    res.status.and.returnValue(res);
};

describe('Testing TutorController', function() {
    beforeEach(resetSpies);
    
    describe('getTutor', function () {
        beforeEach(resetSpies);

        it('should perform a get all when no person id is provided (admin version -- no affiliate -- 2 docs)', function (done) {
            var req = {
                params : {},
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([{success: true, index: 1}, {success: true, index: 2}]);
            done();
        });
        
        it('should perform a get all when no person id is provided (admin version -- no affiliate -- 1 doc)', function (done) {
            var req = {
                params : {},
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith({success: true, index: 1});
            done();
        });
        
        it('should perform a get all when no person id is provided (admin version -- no affiliate -- 0 docs)', function (done) {
            var req = {
                params : {},
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, []); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([]);
            done();
        });
        
        it('should perform a get all when no person id is provided (non-admin version -- affiliate -- 2 docs)', function (done) {
            var req = {
                params : {},
                session : { user : { affiliate: 5 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([{success: true, index: 1}, {success: true, index: 2}]);
            done();
        });
        
        it('should perform a get all when no person id is provided (non-admin version -- affiliate -- 1 doc)', function (done) {
            var req = {
                params : {},
                session : { user : { affiliate: 5 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith({success: true, index: 1});
            done();
        });
        
        it('should perform a get all when no person id is provided (non-admin version -- affiliate -- 0 docs)', function (done) {
            var req = {
                params : {},
                session : { user : { affiliate: 5 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, []); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([]);
            done();
        });
        
        it('should perform a single fetch get when a person id is provided (admin version -- no affiliate -- 2 docs)', function (done) {
            var req = {
                params : { pid : 5 },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([{success: true, index: 1}, {success: true, index: 2}]);
            done();
        });
        
        it('should perform a single fetch get when a person id is provided (admin version -- no affiliate -- 1 doc)', function (done) {
            var req = {
                params : { pid: 5 },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith({success: true, index: 1});
            done();
        });
        
        it('should perform a single fetch get when a person id is provided (admin version -- no affiliate -- 0 docs)', function (done) {
            var req = {
                params : { pid : 5 },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, []); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([]);
            done();
        });
        
        it('should perform a single fetch get when a person id is provided (non-admin version -- affiliate -- 2 docs)', function (done) {
            var req = {
                params : { pid: 5 },
                session : { user : { affiliate: 5 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([{success: true, index: 1}, {success: true, index: 2}]);
            done();
        });
        
        it('should perform a single fetch get when a person id is provided (non-admin version -- affiliate -- 1 doc)', function (done) {
            var req = {
                params : { pid : 5 },
                session : { user : { affiliate: 5 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}]); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith({success: true, index: 1});
            done();
        });
        
        it('should perform a single fetch get when a person id is provided (non-admin version -- affiliate -- 0 docs)', function (done) {
            var req = {
                params : { pid : 5 },
                session : { user : { affiliate: 5 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, []); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([]);
            done();
        });

        it('should report an error if there is one', function (done) {
            var req = {
                params : { pid : 5 },
                session : { user : { affiliate: 5 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(new Error('test')); });
            TutorController.getTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.status).toHaveBeenCalledWith(statusCodes.INTERNAL_SERVER_ERROR);
            expect(res.json).toHaveBeenCalledWith([null]);
            done();
        });
    });
    
    describe('addTutor', function () {
        beforeEach(resetSpies);

        it('should add a tutor when all fields are provided', function(done) {
            
            done();
        });
    });
    
    describe('updateTutor', function () {
        beforeEach(resetSpies);

        it('should update a tutor when all fields are provided', function(done) {
            
            done();
        });
    });
    
    describe('exitTutor', function () {
        beforeEach(resetSpies);

        it('should not exit a tutor if all fields are not provided -- no pid', function(done) {
            var req = {
                params : {},
                session : { user : { affiliate: 0 } }
            };
            TutorController.exitTutor(req, res, next);
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not exit a tutor if all fields are not provided -- incorrect pid type', function(done) {
            var req = {
                params : { pid: '5' },
                session : { user : { affiliate: 0 } }
            };
            TutorController.exitTutor(req, res, next);
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not exit a tutor if all fields are not provided -- no date', function(done) {
            var req = {
                params : { pid: 5 },
                body : {},
                session : { user : { affiliate: 0 } }
            };
            TutorController.exitTutor(req, res, next);
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not exit a tutor if all fields are not provided -- date incorrect type', function(done) {
            var req = {
                params : { pid: 5 },
                body : {
                    date: 'false'
                },
                session : { user : { affiliate: 0 } }
            };
            TutorController.exitTutor(req, res, next);
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not exit a tutor if all fields are not provided -- no doeReason', function(done) {
            var req = {
                params : { pid: 5 },
                body : {
                    date: new Date()
                },
                session : { user : { affiliate: 0 } }
            };
            TutorController.exitTutor(req, res, next);
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not exit a tutor if all fields are not provided -- no lvmReason', function(done) {
            var req = {
                params : { pid: 5 },
                body : {
                    date: new Date(),
                    doeReason: 5
                },
                session : { user : { affiliate: 0 } }
            };
            TutorController.exitTutor(req, res, next);
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should exit a tutor if all fields are provided', function(done) {
            var req = {
                params : { pid: 5 },
                body : {
                    date: new Date(),
                    doeReason: 5,
                    lvmReason: 3
                },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.exitTutor(req, res, next);
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).not.toHaveBeenCalled();
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]);
            done();
        });
        
        it('should report an error if there is one', function(done) {
            var req = {
                params : { pid: 5 },
                body : {
                    date: new Date(),
                    doeReason: 5,
                    lvmReason: 3
                },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(new Error('test')); });
            TutorController.exitTutor(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.status).toHaveBeenCalledWith(statusCodes.INTERNAL_SERVER_ERROR);
            expect(res.json).toHaveBeenCalledWith({success: false});
            done();
        });
    });
    
    describe('logHours', function () {
        beforeEach(resetSpies);

        it('should not log hours if all fields are not present - no pid', function(done) {
            var req = {
                params : { pid : null }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.logHours(req, res, next);
            expect(database.query).not.toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not log hours if all fields are not present - non number pid', function(done) {
            var req = {
                params : { pid : '5' }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.logHours(req, res, next);
            expect(database.query).not.toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not log hours if all fields are not present - no hours', function(done) {
            var req = {
                params : { pid : 5 },
                body : { }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.logHours(req, res, next);
            expect(database.query).not.toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should not log hours if all fields are not present - non-number hours', function(done) {
            var req = {
                params : { pid : 5 },
                body : { hours : '5' }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.logHours(req, res, next);
            expect(database.query).not.toHaveBeenCalled();
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Not all required fields are present.');
            done();
        });
        
        it('should log hours', function(done) {
            var req = {
                params : { pid : 5 },
                body : { hours : 5 }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, hours: 5}]); });
            TutorController.logHours(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.status).not.toHaveBeenCalled();
            expect(res.json).toHaveBeenCalledWith([{isTestData: true, hours: 5}]);
            done();
        });
    });
    
    describe('autocomplete', function () {
        beforeEach(resetSpies);

        it('should not autocomplete less than 3 characters', function(done) {
            var req = {
                params : { name : 't' },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.autocomplete(req, res, next);
            expect(database.query).not.toHaveBeenCalled();
            expect(res.json).toHaveBeenCalledWith([]);
            done();
        });
        
        it('should provide a list of autocompletes', function(done) {
            var req = {
                params : { name : 'tes' },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            TutorController.autocomplete(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.json).toHaveBeenCalledWith([{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]);
            done();
        });
        
        it('should report an error if there is one', function(done) {
            var req = {
                params : { name : 'tes' },
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(new Error('test')); });
            TutorController.autocomplete(req, res, next);
            expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            expect(res.status).toHaveBeenCalledWith(statusCodes.INTERNAL_SERVER_ERROR);
            expect(res.json).toHaveBeenCalledWith([]);
            done();
        });
    });
});