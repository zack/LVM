/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var config = {user_database_path: './test/server/testUsers.json'},
    auth = require('../../app/lib/auth.js')(config),
    statusCodes = require('../../app/lib/statusCodes.js')(),
    AuthenticationController = require('../../app/controllers/AuthenticationController.js')(auth, statusCodes);
    
var fs = require('fs');

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

        // POSITIVE TESTS:
        
        // NEGATIVE TESTS:
        
    });
    
    describe('addTutor', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        
        // NEGATIVE TESTS:
        
    });
    
    describe('updateTutor', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        
        // NEGATIVE TESTS:
        
    });
    
    describe('exitTutor', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        
        // NEGATIVE TESTS:
        
    });
    
    describe('autocomplete', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        
        // NEGATIVE TESTS:
        
    });
});