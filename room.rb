class Room

    attr_reader :playlist

    def initialize(playlist)
        @playlist = playlist
        @guests = []
    end

    def count_songs()
        return @playlist.count()
    end

    def count_guests()
        return @guests.count()
    end

end