describe('student-form', function () {
  beforeEach(angular.mock.module('lvmApp'));

  var $controller;

  beforeEach(inject(function(_$controller_){
    // The injector unwraps the underscores (_) from around the parameter names when matching
    $controller = _$controller_;
  }));

  describe('Ensure that all Student Form Fields are filled', function() {

    it('Should throw an error if all required fields are not filled', function() {
      var $scope = {};
      var controller = $controller('FormController', { $scope: $scope });
      var value = $scope.submitform();
      expect(value.allRequiredFieldsFilled).toBe(false);
    });
  });
});
