angular.module('Tacx', [
    'templates-app',
    'templates-common',
    'ui.router'
])

.controller('AppCtrl', function($rootScope, $scope, $location, $window, $state) {
    $scope.$state = $state;

    $scope.isActive = function(viewLocation) {
        return viewLocation === $location.path();
    };
})

.directive('resize', function ($window, $rootScope) {
    return function(scope, element, attr) {
        var w = angular.element($window);

        scope.$watch(function() {
            return {
                'h': window.innerHeight,
                'w': window.innerWidth
            };
        }, function(newValue, oldValue) {
            console.log('resize to', newValue, 'from', oldValue);
            scope.windowHeight = newValue.h;
            scope.windowWidth = newValue.w;

            scope.$eval(attr.notifier);
        }, true);

        w.bind('resize', function() {
            scope.$apply();
        });
    };
})

;
