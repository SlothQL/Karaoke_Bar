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

    def check_in_guests(guest)
        return @guests.push(guest)
    end

    def check_out_guests(guest)
        return @guests.delete(guest)
    end

    def add_songs(song)
        return @playlist.push(song)
    end

end