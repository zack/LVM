/**
 * Copyright (C) 2016. No part of this file may be replicated without the
 *   explicit written consent of all authors of this project.
 * 
 * Created By: Michael Rodrigues
 */

'use strict';

var envConfig = {},
    constants = require('../../app/lib/constants.js')(),
    statusCodes = require('../../app/lib/statusCodes.js')(),
    HomeController = require('../../app/controllers/HomeController.js')(envConfig, constants, statusCodes);
    
var res,
    next;

var resetSpies = function () {
    res = jasmine.createSpyObj('res', ['render']);
    next = jasmine.createSpy('next');
};

describe('Testing HomeController', function() {
    beforeEach(resetSpies);
    
    describe('login', function() {
        beforeEach(resetSpies);
        
        it('should render the login page', function (done) {
            var req = {};
            HomeController.login(req, res, next);
            expect(res.render).toHaveBeenCalledWith('login', jasmine.any(Object));
            done();
        });
    });
    
    describe('dashboard', function() {
        beforeEach(resetSpies);
        
        it('should render the login page', function (done) {
            var req = {
                session : {
                    user : { username: 'test' }
                }
            };
            HomeController.dashboard(req, res, next);
            expect(res.render).toHaveBeenCalledWith('dashboard', jasmine.any(Object));
            done();
        });
    });
});