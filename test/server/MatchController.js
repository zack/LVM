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

describe('Testing MatchController', function() {
    beforeEach(resetSpies);
    
    describe('getMatches', function () {
        beforeEach(resetSpies);

        it('should perform a get all on all current matches', function (done) {
            var req = {
                params : {},
                session : { user : { affiliate: 0 } }
            };
            spyOn(database, 'query').and.callFake(function (obj, cb) { return cb(null, [{isTestData: true, success: true, index: 1}, {isTestData: true, success: true, index: 2}]); });
            //TutorController.getTutor(req, res, next);
            //expect(database.query).toHaveBeenCalledWith(jasmine.any(Object), jasmine.any(Function));
            //expect(res.json).toHaveBeenCalledWith([{success: true, index: 1}, {success: true, index: 2}]);
            done();
        });
    });
});