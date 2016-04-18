'use strict';

describe('matching', function () {
  describe('MatchController', function() {
    beforeEach(module('lvmApp'));
  
    var $controller;
  
    beforeEach(inject(function(_$controller_){
      // The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_;
    }));
    
    describe('controller.fetchMatches()', function() {
        it('should fetch the list of all matches for the user', function () {
          var $scope = {};
          var thenObj = jasmine.createSpyObj('then', ['then']);
          thenObj.then.and.callFake(function (success, error) {
            var response = {data: []};
            return success(response);
          });
          var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
          var controller = $controller('MatchController', { $scope: $scope, $http: $http });
          controller.fetchMatches();
          expect(controller.matches).toEqual([]);
          expect(controller.fetchError).not.toBeDefined();
        });
        
        it('should report an error if one occurs', function () {
          var $scope = {};
          var thenObj = jasmine.createSpyObj('then', ['then']);
          thenObj.then.and.callFake(function (success, error) {
            var response = {};
            return error(response);
          });
          var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
          var controller = $controller('MatchController', { $scope: $scope, $http: $http });
          controller.fetchMatches();
          expect(controller.fetchError).toEqual(true);
          expect(controller.matches).not.toBeDefined();
        });
    });
    
    describe('controller.createMatch()', function() {
        it('should fetch the list of all matches for the user', function () {
          var $scope = {student : {originalObject : {}}, tutor: {originalObject: {}}};
          var thenObj = jasmine.createSpyObj('then', ['then']);
          thenObj.then.and.callFake(function (success, error) {
            var response = {data: true};
            return success(response);
          });
          var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
          var controller = $controller('MatchController', { $scope: $scope, $http: $http });
          controller.createMatch();
          expect(controller.matchCreated).toEqual(true);
        });
        
        it('should report an error if one occurs', function () {
          var $scope = {student : {originalObject : {}}, tutor: {originalObject: {}}};
          var thenObj = jasmine.createSpyObj('then', ['then']);
          thenObj.then.and.callFake(function (success, error) {
            var response = {data: 'No student provided.'};
            return error(response);
          });
          var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
          var controller = $controller('MatchController', { $scope: $scope, $http: $http });
          controller.createMatch();
          expect(controller.matchCreated).toEqual(false);
          expect(controller.matchErrorMessage).toEqual('No student provided.');
        });
    });
    
    describe('controller.dissolveMatch()', function() {
        it('should fetch the list of all matches for the user', function () {
          var $scope = {};
          var thenObj = jasmine.createSpyObj('then', ['then']);
          thenObj.then.and.callFake(function (success, error) {
            var response = {data: true};
            return success(response);
          });
          var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
          var controller = $controller('MatchController', { $scope: $scope, $http: $http });
          controller.matches = [{id: 0}];
          controller.dissolveMatch(0);
          expect(controller.manageMatchResponse).toEqual(true);
        });
        
        it('should report an error if one occurs', function () {
          var $scope = {};
          var thenObj = jasmine.createSpyObj('then', ['then']);
          thenObj.then.and.callFake(function (success, error) {
            var response = {data: 'Already dissolved.'};
            return error(response);
          });
          var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
          var controller = $controller('MatchController', { $scope: $scope, $http: $http });
          controller.matches = [{id: 0}];
          controller.dissolveMatch(0);
          expect(controller.manageMatchResponse).toEqual(false);
          expect(controller.manageErrorMessage).toEqual('Already dissolved.');
        });
    });
  });
});