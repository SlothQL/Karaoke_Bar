require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../room')
require_relative('../song')

class TestGuest < Minitest::Test

    def setup()
        @favourite_song1 = Song.new("Foo Fighters", "Learn to fly")
        @favourite_song2 = Song.new("Bruce Springsteen", "Streets of Philadelphia")

        @song1 = Song.new("Foo Fighters", "Everlong")
        @song2 = Song.new("Rick Astley", "Never gonna give you up")

        @playlist = [@song1, @song2]

        @karaoke_room = Room.new("Room 1", @playlist, 3, 5)

        @guest1 = Guest.new("Ben", 35, 50, @favourite_song1)
        @guest2 = Guest.new("Alina", 32, 25, @song1)
        @guest3 = Guest.new("Julien", 29, 3, @favourite_song2)
    end

    def test_guest_has_name()
        assert_equal("Ben", @guest1.name)
    end

    def test_guest_has_age()
        assert_equal(32, @guest2.age)
    end

    def test_guest_has_money()
        assert_equal(25, @guest2.money)
    end

    def test_guest_has_favourite_song()
        assert_equal(@favourite_song1, @guest1.favourite_song)
    end

    def test_guest_has_enough_money_true()
        assert_equal(true, @guest1.enough_money?(@karaoke_room))
    end

    def test_guest_has_enough_money_false()
        assert_equal(false, @guest3.enough_money?(@karaoke_room))
    end

    def test_guest_can_pay_fee()
        @guest1.pay_fee(@karaoke_room)
        assert_equal(45, @guest1.money)
    end

    def test_favourite_song_is_in_playlist_true()
        fav_song = @guest2.favourite_song_in_room(@karaoke_room)
        assert_equal("Wohoo!", fav_song)
    end

    def test_favourite_song_is_in_playlist_true()
        fav_song = @guest1.favourite_song_in_room(@karaoke_room)
        assert_equal("We are sorrv but 'Learn to fly' is not in the playlist.", fav_song)
    end

end