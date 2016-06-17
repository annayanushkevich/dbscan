(function ()
  "use strict";
  angular.module("app").controller("passwordCtrl",function($scope, $http) {
    
    $scope.password = function(password) {
      var password = {
        password: password,
      }
      $http.post('',password).then(funtion(response) {
        $scope.password.push(response.data);
      })


  
window.$scope = $scope
   });
   
  })();