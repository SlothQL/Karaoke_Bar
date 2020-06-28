require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

    def setup()
        @favourite_song1 = Song.new("Foo Fighters", "Learn to fly")
        @favourite_song2 = Song.new("Bruce Springsteen", "Streets of Philadelphia")

        @song1 = Song.new("Foo Fighters", "Everlong")
        @song2 = Song.new("Rick Astley", "Never gonna give you up")
        @song3 = Song.new("Incubus", "Wish you were here")
        @song4 = Song.new("Blink182", "Aliens exist")
        @song5 = Song.new("Eagles of Death Metal", "Wannabe in L.A.")

        @karaoke_room = Room.new("Room 1", 3, 5)

        @guest1 = Guest.new("Ben", 35, 50, @favourite_song1)
        @guest2 = Guest.new("Alina", 32, 25, @song1)
        @guest3 = Guest.new("Julien", 29, 9, @favourite_song2)
        @guest4 = Guest.new("Dani", 29, 17, @song4)
        @guest5 = Guest.new("Johanna", 24, 3, @song3)
    end

    def test_room_can_add_song()
        @karaoke_room.add_songs(@song1)
        @karaoke_room.add_songs(@song5)
        assert_equal(2, @karaoke_room.count_songs())
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

    def test_room_has_song_in_playlist_true()
        @karaoke_room.add_songs(@song1)
        @karaoke_room.add_songs(@song5)
        @karaoke_room.add_songs(@song3)
        assert_equal(true, @karaoke_room.is_song_in_playlist?(@song3))
    end

    def test_room_has_song_in_playlist_false()
        @karaoke_room.add_songs(@song1)
        @karaoke_room.add_songs(@song4)
        @karaoke_room.add_songs(@song3)
        assert_equal(false, @karaoke_room.is_song_in_playlist?(@song5))
    end

end