require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

    def setup()
        @guest1 = Guest.new("Ben", 35)
        @guest2 = Guest.new("Alina", 32)
        @song1 = Song.new("Foo Fighters", "Everlong")
        @song2 = Song.new("Rick Astley", "Never gonna give you up")
        @song3 = Song.new("Incubus", "Wish you were here")
        @song4 = Song.new("Blink182", "Aliens exist")
        @playlist = [@song1, @song2, @song3, @song4]
        @karaoke_room = Room.new(@playlist)
    end

    def test_room_has_playlist()
        assert_equal(4, @karaoke_room.count_songs())
    end

    def test_room_count_guests()
        assert_equal(0, @karaoke_room.count_guests())
    end


end