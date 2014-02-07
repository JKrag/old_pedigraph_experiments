'use strict';

angular.module('pedigraphApp')
  .controller('MainCtrl', function($scope, $http) {
    $scope.doSearch = function() {
      $http.post('http://localhost:7474/db/data/cypher/',
        '{"query" : "MATCH (a:Cat) WHERE a.id=~{id} RETURN a LIMIT 100", "params" : {"id" : "' + $scope.search + '.*"} }')
        .success(function(data) {
          $scope.cats = data.data;
          console.log(data.data[0][0].data.id);
        })
        .error(function() {
          console.log('Failed!');
        });
    };
  });