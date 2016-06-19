
  // use strict;
  angular.module("app").controller("passwordCtrl",function($scope, $http) {
    
    $scope.sendPassword = function(accepted_password) {
      var password = {
        password: accepted_password,
      }
      $http.post('http://localhost:3000/api/v1/passwords',password).then(function(response) {
        console.log(response.data);
        $scope.passwordMessage = response.data;
      })


  
   };
   
  });