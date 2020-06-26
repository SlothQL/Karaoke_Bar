require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')

class TestGuest < Minitest::Test

    def setup()
        @guest1 = Guest.new("Ben", 35)
        @guest2 = Guest.new("Alina", 32)
    end

    def test_guest_has_name()
        assert_equal("Ben", @guest1.name)
    end

    def test_guest_has_age()
        assert_equal(32, @guest2.age)
    end

end