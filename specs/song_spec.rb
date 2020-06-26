require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

    def setup()
        @everlong = Song.new("Foo Fighters", "Everlong")
    end

    def test_song_has_singer()
        assert_equal("Foo Fighters", @everlong.singer)
    end

    def test_song_has_title()
        assert_equal("Everlong", @everlong.title)
    end
end