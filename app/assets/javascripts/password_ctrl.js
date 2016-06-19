(function ()
  "use strict";
  angular.module("app").controller("passwordCtrl",function($scope, $http) {
    
    $scope.sendPassword = function(accepted_password) {
      var password = {
        password: accepted_password,
      }
      $http.post('',password).then(funtion(response) {
        $scope.password.push(response.data);
      })


  
window.$scope = $scope
   });
   
  })();