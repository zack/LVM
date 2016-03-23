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

describe('Testing AuthenticationController', function() {
    beforeEach(resetSpies);
    
    describe('createAccount', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        it('should create an account when all info is provided', function (done) {
            var req = { 
                body : {
                    username: 'test',
                    password: 'testing',
                    role: 'Tester',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account created successfully!');
            done();
        });
        
        it('should create an account when all info is provided - 2', function (done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: 'mikethedev',
                    role: 'Dev',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account created successfully!');
            done();
        });
        
        it('should create an account with a long account username (240 characters)', function (done) {
            var req = { 
                body : {
                    username: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    password: 'testing',
                    role: 'Tester',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account created successfully!');
            done();
        });
        
        it('should create an account with a long password (240 characters)', function (done) {
            var req = { 
                body : {
                    username: 'tester',
                    password: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    role: 'Tester',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account created successfully!');
            done();
        });
        
        // NEGATIVE TESTS:        
        it('should throw an error if there is no username', function (done) {
            var req = { 
                body : {
                    username: '',
                    password: 'testing',
                    role: 'Tester',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A username is required.');
            done();
        });
        
        it('should throw an error if the username is in use', function (done) {
            var req = { 
                body : {
                    username: 'test',
                    password: 'testing',
                    role: 'Tester',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('The username is already in use.');
            done();
        });
        
        it('should throw an error if there is no password', function (done) {
            var req = { 
                body : {
                    username: 't2',
                    password: '',
                    role: 'Tester',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A password is required.');
            done();
        });
        
        it('should throw an error if there is no role', function (done) {
            var req = { 
                body : {
                    username: 't2',
                    password: 'testing',
                    role: '',
                    branch: 1
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A user role is required.');
            done();
        });
        
        it('should throw an error if there is no branch', function (done) {
            var req = { 
                body : {
                    username: 't2',
                    password: 'testing',
                    role: 'Tester'
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('An affiliate branch is required.');
            done();
        });
        
        it('should create an account when all info is provided with special characters and extreme values', function (done) {
            var req = { 
                body : {
                    username: '>todo!tester@google.comZ<',
                    password: '#%$@^@$^()*)*#@$JL',
                    role: 'YES%##@@#$',
                    branch: -1234235136346531465436245656
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account created successfully!');
            done();
        });
        
        it('should create an account when all info is provided with special characters and extreme values - 2', function (done) {
            var req = { 
                body : {
                    username: '>todo!tester@google.comZ<2',
                    password: '#%$@^@$^()*)*#@$JL',
                    role: 'YES%##@@#$',
                    branch: -1234235136346531465436245656
                }
            };
            AuthenticationController.createAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account created successfully!');
            done();
        });
    });
    
    describe('updatePassword', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        it('should update the password when all info is provided', function (done) {
            var req = { 
                body : {
                    username: 'test',
                    password: 'testing',
                    newPassword: 'test123'
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Password was updated successfully!');
            done();
        });
        
        it('should update the password with a long username (240 characters)', function (done) {
            var req = { 
                body : {
                    username: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    password: 'testing',
                    newPassword: 'testing'
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Password was updated successfully!');
            done();
        });
        
        it('should update the password with a long password (240 characters)', function (done) {
            var req = { 
                body : {
                    username: 'tester',
                    password: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    newPassword: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421'
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Password was updated successfully!');
            done();
        });
        
        it('should not update the password if the current password is not correct', function (done) {
            var req = { 
                body : {
                    username: 'test',
                    password: 'tester0', // bad password
                    newPassword: 'test123'
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('Could not authenticate. The current password does not match.');
            done();
        });
        
        // NEGATIVE TESTS:
        it('should not update the password when a username is not provided', function (done) {
            var req = { 
                body : {
                    username: '',
                    password: 'testing',
                    newPassword: 'test123'
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A username is required.');
            done();
        });
        
        it('should not update the password when the current password was not provided', function (done) {
            var req = { 
                body : {
                    username: 'test',
                    password: '',
                    newPassword: 'test123'
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('The current password is required.');
            done();
        });
        
        it('should not update the password when the new password was not provided', function (done) {
            var req = { 
                body : {
                    username: 'test',
                    password: 'test123',
                    newPassword: ''
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A new password is required.');
            done();
        });
        
        it('should update the password with special characters', function (done) {
            var req = { 
                body : {
                    username: 'test',
                    password: 'test123',
                    newPassword: 'testing!@'
                }
            };
            AuthenticationController.updatePassword(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Password was updated successfully!');
            done();
        });
    });
    
    describe('deleteAccount', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        it('should delete the account when all info is provided', function (done) {
            var req = { 
                body : {
                    username: 'test'
                }
            };
            AuthenticationController.deleteAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account deleted successfully!');
            done();
        });
        
        it('should delete the account when the username contains special characters', function (done) {
            var req = { 
                body : {
                    username: '>todo!tester@google.comZ<'
                }
            };
            AuthenticationController.deleteAccount(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Account deleted successfully!');
            done();
        });
        
        // NEGATIVE TESTS:
        it('should not delete an account when a username is not provided', function (done) {
            var req = { 
                body : {
                    username: ''
                }
            };
            AuthenticationController.deleteAccount(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A username is required.');
            done();
        });
    });
    
    describe('updateBranch', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        it('should update the branch when all info is provided', function (done) {
            var req = { 
                body : {
                    username: 'tester',
                    branch: 5
                }
            };
            AuthenticationController.updateBranch(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Branch was updated successfully!');
            done();
        });
        
        it('should update the branch when the username is provided (240 characters)', function (done) {
            var req = { 
                body : {
                    username: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    branch: 5
                }
            };
            AuthenticationController.updateBranch(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Branch was updated successfully!');
            done();
        });
        
        it('should update the branch when the branch is provided (large value)', function (done) {
            var req = { 
                body : {
                    username: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    branch: 32421351435612362456245624573475367356745645674567456745674567456
                }
            };
            AuthenticationController.updateBranch(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Branch was updated successfully!');
            done();
        });
        
        // NEGATIVE TESTS:
        it('should not update the branch when a username is not provided', function (done) {
            var req = { 
                body : {
                    username: '',
                    branch: 5
                }
            };
            AuthenticationController.updateBranch(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A username is required.');
            done();
        });
        
        it('should not update the branch when a branch is not provided', function (done) {
            var req = { 
                body : {
                    username: 'tester'
                }
            };
            AuthenticationController.updateBranch(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('An affiliate branch is required.');
            done();
        });
        
        it('should not update the branch when multiple branches are provided', function (done) {
            var req = { 
                body : {
                    username: 'tester',
                    branch: [5, 2]
                }
            };
            AuthenticationController.updateBranch(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('An affiliate branch is required.');
            done();
        });
    });
    
    describe('updateRole', function () {
        beforeEach(resetSpies);

        // POSITIVE TESTS:
        it('should update the role when all info is provided', function (done) {
            var req = { 
                body : {
                    username: 'tester',
                    role: 'Test Dev'
                }
            };
            AuthenticationController.updateRole(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Role was updated successfully!');
            done();
        });
        
        it('should update the role when the username is provided (240 characters)', function (done) {
            var req = { 
                body : {
                    username: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    role: 'Number Tester'
                }
            };
            AuthenticationController.updateRole(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Role was updated successfully!');
            done();
        });
        
        it('should update the role when the branch is provided (large value)', function (done) {
            var req = { 
                body : {
                    username: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    role: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421'
                }
            };
            AuthenticationController.updateRole(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).toHaveBeenCalledWith('Role was updated successfully!');
            done();
        });
        
        // NEGATIVE TESTS:
        it('should not update the role when a username is not provided', function (done) {
            var req = { 
                body : {
                    username: '',
                    role: 'Tester'
                }
            };
            AuthenticationController.updateRole(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A username is required.');
            done();
        });
        
        it('should not update the role when a role is not provided', function (done) {
            var req = { 
                body : {
                    username: 'tester'
                }
            };
            AuthenticationController.updateRole(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A user role is required.');
            done();
        });
        
        it('should not update the role when multiple branches are provided', function (done) {
            var req = { 
                body : {
                    username: 'tester',
                    branch: ['Role 1', 'Role 2']
                }
            };
            AuthenticationController.updateRole(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A user role is required.');
            done();
        });
    });
    
    describe('login', function() {
        beforeEach(resetSpies);
        
        // POSITIVE TESTS:
        it('should authenticate a user that with the correct username and password', function (done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: 'mikethedev'
                },
                session: {
                    regenerate: null
                }
            };
            spyOn(req.session, 'regenerate').and.callFake(function (cb) { return cb(null); });
            
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/dashboard');
            done();
        });
        
        it('should authenticate a user with a long username (240 characters)', function(done) {
            var req = { 
                body : {
                    username: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421',
                    password: 'testing'
                },
                session: {
                    regenerate: null
                }
            };
            spyOn(req.session, 'regenerate').and.callFake(function (cb) { return cb(null); });
            
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/dashboard');
            done();
        });
        
        it('should authenticate a user with a long password (240 characters)', function(done) {
            var req = { 
                body : {
                    username: 'tester',
                    password: '498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421498066631439527714214980666314395277142149806663143952771421'
                },
                session: {
                    regenerate: null
                }
            };
            spyOn(req.session, 'regenerate').and.callFake(function (cb) { return cb(null); });
            
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/dashboard');
            done();
        });
        
        it('should not authenticate a user with incorrect credentials', function(done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: 'mikeisnotadev'
                },
                session: {
                    regenerate: jasmine.createSpy('regenerate')
                }
            };
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/login?errorMessage=Bad username or password.');
            done();
        });
        
        it('should not authenticate a user if there are too many attempts and too short a period since the last one', function(done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: 'mikethedev'
                },
                session: {
                    lastLoginAttemptTime: new Date().getTime(),
                    loginAttempts: 70
                }
            };
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/login?errorMessage=Maximum login attempts reached. Please try again in 10 minutes.');
            done();
        });
        
        it('should authenticate a user if there were too many attempts, but the time has expired', function(done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: 'mikethedev'
                },
                session: {
                    lastLoginAttemptTime: new Date().getTime() - (1000 * 60 * 30),
                    loginAttempts: 70,
                    regenerate: null
                }
            };
            spyOn(req.session, 'regenerate').and.callFake(function (cb) { return cb(null); });
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/dashboard');
            done();
        });
        
        // NEGATIVE TESTS:
        it('should not authenticate a user with no username', function(done) {
            var req = { 
                body : {
                    username: '',
                    password: 'mikethedev'
                }
            };
            AuthenticationController.login(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A username is required.');
            done();
        });
        
        it('should not authenticate a user with no password', function(done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: ''
                }
            };
            AuthenticationController.login(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.BAD_REQUEST_STATUS);
            expect(res.send).toHaveBeenCalledWith('A password is required.');
            done();
        });
        
        it('should authenticate a user with special characters in the username and password fields', function(done) {
            var req = { 
                body : {
                    username: '>todo!tester@google.comZ<2',
                    password: '#%$@^@$^()*)*#@$JL'
                },
                session: {
                    regenerate: null
                }
            };
            spyOn(req.session, 'regenerate').and.callFake(function (cb) { return cb(null); });
            
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/dashboard');
            done();
        });
        
        it('should not redirect a successful login if there is an error with the session', function(done) {
            var req = { 
                body : {
                    username: '>todo!tester@google.comZ<2',
                    password: '#%$@^@$^()*)*#@$JL'
                },
                session: {
                    regenerate: null
                }
            };
            spyOn(req.session, 'regenerate').and.callFake(function (cb) { return cb(new Error()); });
            
            AuthenticationController.login(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/login?errorMessage=Unable to create a new session.');
            done();
        });
    });
    
    describe('logout', function() {
        beforeEach(resetSpies);
        
        // POSITIVE TESTS:
        it('should log a user out', function (done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: 'mikethedev'
                },
                session: {
                    destroy: null
                }
            };
            spyOn(req.session, 'destroy').and.callFake(function (cb) { return cb(null); });
            
            AuthenticationController.logout(req, res, next);
            
            expect(res.status).not.toHaveBeenCalled();
            expect(res.send).not.toHaveBeenCalled();
            expect(res.redirect).toHaveBeenCalledWith('/lvm/login');
            done();
        });
        
        // NEGATIVE TESTS:
        it('should report an error if there is one during a logout', function(done) {
            var req = { 
                body : {
                    username: 'mike',
                    password: 'mikethedev'
                },
                session: {
                    destroy: null
                }
            };
            spyOn(req.session, 'destroy').and.callFake(function (cb) { return cb(new Error()); });
            
            AuthenticationController.logout(req, res, next);
            
            expect(res.status).toHaveBeenCalledWith(statusCodes.INTERNAL_SERVER_ERROR);
            expect(res.send).toHaveBeenCalled();
            expect(res.redirect).not.toHaveBeenCalled();
            done();
        });
    });
    
    // Note: this is the only way to be sure to run the cleanup after all tests run
    it('should remove the test user database file', function (done) {
        if (fs.existsSync('./test/server/testUsers.json')) {
            fs.unlinkSync('./test/server/testUsers.json');
        }
        done();
    });
});