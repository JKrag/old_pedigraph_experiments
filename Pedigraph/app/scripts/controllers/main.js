'use strict';

angular.module('pedigraphApp')
  .controller('MainCtrl', function($scope, $http) {
    $scope.doSearch = function() {
      $http.post('http://localhost:7474/db/data/cypher/',
        '{"query" : "MATCH (a:Cat) OPTIONAL MATCH (a:Cat)-[:SIRE]->(s:Cat) OPTIONAL MATCH (a:Cat)-[:DAM]->(d:Cat) WHERE a.id=~{id} RETURN a,s LIMIT 100", "params" : {"id" : "' + $scope.search + '.*"} }')
        .success(function(data) {
          $scope.cats = data.data;
          console.log(data.data[0][0].data.id);
        })
        .error(function() {
          console.log('Failed!');
        });
    };
  });

//    '{"query" : "MATCH (a:Cat) OPTIONAL MATCH (a:Cat)-[:SIRE]->(s:Cat) OPTIONAL MATCH (a:Cat)-[:DAM]->(d:Cat) WHERE a.id=~{id} RETURN a,s LIMIT 100", "params" : {"id" : "' + $scope.search + '.*"} }')
//    '{"query" : "MATCH (d:Cat)<-[:DAM]-(a:Cat)-[:SIRE]->(s:Cat)  WHERE a.id=~{id} RETURN a,s,d LIMIT 100", "params" : {"id" : "' + $scope.search + '.*"} }')
//    '{"query" : "MATCH (a:Cat) WHERE a.id=~{id} OPTIONAL MATCH (a)-[rs:SIRE]->(s) OPTIONAL MATCH (a)-[rd:DAM]->(d) RETURN a,s,d LIMIT 100", "params" : {"id" : "' + $scope.search + '.*"} }')
//    '{"query" : "MATCH (a:Cat) OPTIONAL MATCH (a:Cat)-[:SIRE]->(s:Cat) OPTIONAL MATCH (a:Cat)-[:DAM]->(d:Cat) WHERE a.id=~{id} RETURN a,s LIMIT 100", "params" : {"id" : "' + $scope.search + '.*"} }')
