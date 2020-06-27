require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')
require_relative('../bar')

class TestBar < Minitest::Test

    def setup()
        @favourite_song1 = Song.new("Foo Fighters", "Learn to fly")
        @favourite_song2 = Song.new("Bruce Springsteen", "Streets of Philadelphia")

        @song1 = Song.new("Foo Fighters", "Everlong")
        @song2 = Song.new("Rick Astley", "Never gonna give you up")
        @song3 = Song.new("Incubus", "Wish you were here")
        @song4 = Song.new("Blink182", "Aliens exist")

        @playlist = [@song1, @song2, @song3, @song4]

        @karaoke_room = Room.new("Room 1", @playlist, 3, 5)

        @guest1 = Guest.new("Ben", 35, 50, @favourite_song1)
        @guest2 = Guest.new("Alina", 32, 25, @song1)
        @guest3 = Guest.new("Julien", 29, 9, @favourite_song2)
        @guest4 = Guest.new("Dani", 29, 17, @song4)
        @guest5 = Guest.new("Johanna", 24, 3, @song3)

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

    def test_guest_cannot_rent_room()
        poor_guest = @bar.rent_room(@karaoke_room, @guest5)
        assert_nil(nil, poor_guest)
        assert_equal(1000, @bar.till)
        assert_equal(3, @guest5.money)
        assert_equal(0, @karaoke_room.count_guests())
    end

    def test_bar_rents_room_full_capacity()
        @bar.rent_room(@karaoke_room, @guest1)
        @bar.rent_room(@karaoke_room, @guest2)
        @bar.rent_room(@karaoke_room, @guest3)
        too_many_people = @bar.rent_room(@karaoke_room, @guest4)
        assert_equal(3, @karaoke_room.count_guests())
        assert_nil(nil, too_many_people)
        assert_equal(1015, @bar.till)
        assert_equal(45, @guest1.money)
        assert_equal(20, @guest2.money)
        assert_equal(4, @guest3.money)
        assert_equal(17, @guest4.money)
    end

end