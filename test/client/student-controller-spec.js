describe('student-form', function () {
  describe('FormController', function() {
    beforeEach(module('lvmApp'));

    var $controller;

    beforeEach(inject(function(_$controller_){
      // The injector unwraps the underscores (_) from around the parameter names when matching
      $controller = _$controller_;
    }));

    describe('$scope.gatherValues', function() {
      it('should validate that the function returns 5', function() {
        var $scope = {};
        var controller = $controller('FormController', { $scope: $scope });
        // var retVal = $scope.gatherValues();
        // expect(retVal).toEqual(5);
      });
    });
  });
});
