require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../bar')

class TestBar < Minitest::Test

    def setup()
        @guest1 = Guest.new("Ben", 35, 50)
        @guest2 = Guest.new("Alina", 32, 25)
        @song1 = Song.new("Foo Fighters", "Everlong")
        @song2 = Song.new("Rick Astley", "Never gonna give you up")
        @song3 = Song.new("Incubus", "Wish you were here")
        @song4 = Song.new("Blink182", "Aliens exist")
        @playlist = [@song1, @song2, @song3, @song4]
        @karaoke_room = Room.new("Room 1", @playlist, 3, 5)
        @bar = Bar.new("Sing City", 1000)
    end

    def test_bar_has_name()
        assert_equal("Sing City", @bar.name)
    end

    def test_bar_has_till()
        assert_equal(1000, @bar.till)
    end

    def test_bar_can_rent_room_to_guest()
        @bar.rent_room(@karaoke_room, @guest2)
        assert_equal(1, @karaoke_room.count_guests())
        assert_equal(1005, @bar.till)
        assert_equal(20, @guest2.money)
    end


end