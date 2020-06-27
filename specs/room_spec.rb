require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

    def setup()
        @guest1 = Guest.new("Ben", 35, 50)
        @guest2 = Guest.new("Alina", 32, 25)
        @guest3 = Guest.new("Julien", 29, 9)
        @guest4 = Guest.new("Dani", 29, 17)
        @guest5 = Guest.new("Johanna", 24, 3)
        @song1 = Song.new("Foo Fighters", "Everlong")
        @song2 = Song.new("Rick Astley", "Never gonna give you up")
        @song3 = Song.new("Incubus", "Wish you were here")
        @song4 = Song.new("Blink182", "Aliens exist")
        @song5 = Song.new("Eagles of Death Metal", "Wannabe in L.A.")
        @playlist = [@song1, @song2, @song3, @song4]
        @karaoke_room = Room.new("Room 1", @playlist, 3, 5)
    end

    def test_room_has_playlist()
        assert_equal(4, @karaoke_room.count_songs())
    end

    def test_room_has_capacity()
        assert_equal(3, @karaoke_room.capacity)
    end

    def test_room_has_entry_fee_per_person()
        assert_equal(5, @karaoke_room.entry_fee)
    end

    def test_room_has_name()
        assert_equal("Room 1", @karaoke_room.room_name)
    end

    def test_room_count_guests()
        assert_equal(0, @karaoke_room.count_guests())
    end

    def test_room_can_check_in_guest()
        @karaoke_room.check_in_guests(@guest1)
        assert_equal(1, @karaoke_room.count_guests())
    end

    def test_room_can_check_in_two_guests()
        @karaoke_room.check_in_guests(@guest1)
        @karaoke_room.check_in_guests(@guest2)
        assert_equal(2, @karaoke_room.count_guests())
    end
    
    def test_room_can_check_out_guest()
        @karaoke_room.check_in_guests(@guest1)
        @karaoke_room.check_in_guests(@guest2)
        @karaoke_room.check_out_guests(@guest1)
        assert_equal(1, @karaoke_room.count_guests())
    end

    def test_room_can_add_song()
        @karaoke_room.add_songs(@song5)
        assert_equal(5, @karaoke_room.count_songs())
    end

end