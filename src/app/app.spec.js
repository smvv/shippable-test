describe('Tacx', function() {
    beforeEach(module('Tacx'));

    it('should pass a dummy test', inject(function() {
        expect(true).toBeTruthy();
    }));

    it('should fail a dummy test', inject(function() {
        expect(false).toBeTruthy();
    }));
});
