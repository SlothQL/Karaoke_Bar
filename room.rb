class Room

    attr_reader :room_name, :playlist, :capacity, :entry_fee

    def initialize(room_name, playlist, capacity, entry_fee)
        @room_name = room_name
        @playlist = playlist
        @capacity = capacity
        @entry_fee = entry_fee
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

    def is_song_in_playlist?(song)
        return @playlist.include?(song)
    end
        
end