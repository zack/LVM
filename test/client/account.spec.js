'use strict';

describe('admin', function () {
  describe('AdminController', function() {
    beforeEach(module('lvmApp'));
  
    var $controller;
  
    beforeEach(inject(function(_$controller_){
      // The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_;
    }));
  
    describe('form.changePassword();', function() {
      it('should update the password on success', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {
            data : []
          };
          return success(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        //controller.fetchAccounts();
        //expect($http).toHaveBeenCalledWith(jasmine.any(Object));
      }); 
      
      it('should report an error if unable to change the password', function() {
        var $scope = {};
        var thenObj = jasmine.createSpyObj('then', ['then']);
        thenObj.then.and.callFake(function (success, error) {
          var response = {};
          return error(response);
        });
        var $http = jasmine.createSpy('$http').and.returnValue(thenObj);
        var controller = $controller('AdminController', { $scope: $scope, $http: $http });
        //controller.fetchAccounts();
        //expect($http).toHaveBeenCalledWith(jasmine.any(Object));
      });
    });
  });
});