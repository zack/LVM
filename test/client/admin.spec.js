'use strict';

describe('admin', function () {
  describe('AdminController', function() {
    beforeEach(module('lvmApp'));
  
    var $controller;
  
    beforeEach(inject(function(_$controller_){
      // The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_;
    }));
  
    describe('form.fetchAccounts();', function() {
      it('should set the accounts on success', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {
            data : [
              {
                "id": 0,
                "username": "roberta",
                "role": "Administrator",
                "branch": 0
              }
            ]
          };
          return success(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        controller.fetchAccounts();
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.accounts).toEqual([{
          "id": 0,
          "username": "roberta",
          "role": "Administrator",
          "branch": 0,
          "branchName": "Administrator (Non-Affiliated)"
        }]);
        expect($scope.manageRoles.length).toEqual(controller.accounts.length);
        expect($scope.manageAffiliates.length).toEqual(controller.accounts.length);
      });
      
      it('should report an error if unable to fetch accounts', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return error(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        controller.fetchAccounts();
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.accounts).not.toBeDefined();
        expect($scope.manageRoles.length).toEqual(0);
        expect($scope.manageAffiliates.length).toEqual(0);
      });
    });
    
    describe('form.createAccount();', function() {
      it('should create an account', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return success(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        $scope.username = 'test';
        $scope.password = 'testing';
        $scope.role = 'Administrator';
        $scope.branch = "5"; // Boston
        spyOn(controller, 'fetchAccounts');
        controller.createAccount();
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.accountCreated).toEqual(true);
        expect(controller.fetchAccounts).toHaveBeenCalled();
      });
      
      it('should report an error during account creation', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {data: 'A username is required.'};
          return error(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        $scope.username = 'test';
        $scope.password = 'testing';
        $scope.role = 'Administrator';
        $scope.branch = "5"; // Boston
        spyOn(controller, 'fetchAccounts');
        controller.createAccount();
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.accountCreated).toEqual(false);
        expect(controller.accountCreationErrorMessage).toEqual('A username is required.');
        expect(controller.fetchAccounts).not.toHaveBeenCalled();
      });
    });
    
    describe('form.updatePassword();', function() {
      it('should update a password', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return success(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'prompt').and.returnValue('testing');
        controller.updatePassword('test');
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(true);
        expect(controller.successManageMessage).toEqual('Password updated successfully!');
      });
      
      it('should report an error while updating a password', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {data: 'A new password is required.'};
          return error(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'prompt').and.returnValue('testing');
        controller.updatePassword('test');
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(false);
        expect(controller.errorManageMessage).toEqual('A new password is required.');
      });
    });
    
    describe('form.updateAffiliate();', function() {
      it('should update an affiliate', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return success(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(true);
        $scope.manageAffiliates = [5];
        spyOn(controller, 'fetchAccounts');
        controller.updateAffiliate('test', 0);
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(true);
        expect(controller.successManageMessage).toEqual('Affiliate updated successfully!');
        expect(controller.fetchAccounts).toHaveBeenCalled();
      });
      
      it('should not update an affiliate if the user does not confirm', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return response;
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(false);
        controller.updateAffiliate('test');
        expect(controller.manageStatus).not.toBeDefined();
        expect(controller.successManageMessage).not.toBeDefined();
      });
      
      it('should report an error while updating an affiliate', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {data : 'An affiliate branch is required.'};
          return error(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(true);
        $scope.manageAffiliates = [5];
        spyOn(controller, 'fetchAccounts');
        controller.updateAffiliate('test', 0);
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(false);
        expect(controller.errorManageMessage).toEqual('An affiliate branch is required.');
        expect(controller.fetchAccounts).not.toHaveBeenCalled();
      });
    });
    
    describe('form.updateRole();', function() {
      it('should update a role', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return success(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(true);
        $scope.manageRoles = [5];
        spyOn(controller, 'fetchAccounts');
        controller.updateRole('test', 0);
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(true);
        expect(controller.successManageMessage).toEqual('Role updated successfully!');
        expect(controller.fetchAccounts).toHaveBeenCalled();
      });
      
      it('should not update a role if the user does not confirm', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return response;
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(false);
        controller.updateRole('test');
        expect(controller.manageStatus).not.toBeDefined();
        expect(controller.successManageMessage).not.toBeDefined();
      });
      
      it('should report an error while updating a role', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {data : 'A role is required.'};
          return error(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(true);
        $scope.manageAffiliates = [5];
        spyOn(controller, 'fetchAccounts');
        controller.updateRole('test', 0);
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(false);
        expect(controller.errorManageMessage).toEqual('A role is required.');
        expect(controller.fetchAccounts).not.toHaveBeenCalled();
      });
    });
    
    describe('form.deleteAccount();', function() {
      it('should delete an account', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return success(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(true);
        spyOn(controller, 'fetchAccounts');
        controller.deleteAccount('test');
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(true);
        expect(controller.successManageMessage).toEqual('Account deleted successfully!');
        expect(controller.fetchAccounts).toHaveBeenCalled();
      });
      
      it('should not delete an account if the user does not confirm', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return response;
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(false);
        controller.deleteAccount('test');
        expect(controller.manageStatus).not.toBeDefined();
        expect(controller.successManageMessage).not.toBeDefined();
      });
      
      it('should report an error while deleting an account', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {data : 'Error deleting account.'};
          return error(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        spyOn(window, 'confirm').and.returnValue(true);
        spyOn(controller, 'fetchAccounts');
        controller.deleteAccount('test');
        expect($http).toHaveBeenCalledWith(jasmine.any(Object));
        expect(thenObj.then).toHaveBeenCalledWith(jasmine.any(Function), jasmine.any(Function));
        expect(controller.manageStatus).toEqual(false);
        expect(controller.errorManageMessage).toEqual('Error deleting account.');
        expect(controller.fetchAccounts).not.toHaveBeenCalled();
      });
    });
  });
});