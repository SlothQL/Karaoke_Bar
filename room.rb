class Room

    attr_reader :playlist, :capacity

    def initialize(playlist, capacity)
        @playlist = playlist
        @capacity = capacity
        @guests = []
    end

    def count_songs()
        return @playlist.count()
    end

    def count_guests()
        return @guests.count()
    end

    def check_in_guests(guest)
        if @capacity > @guests.count
            return @guests.push(guest) 
        else 
            return "I am sorry, but our room has only space for #{@capacity} people." 
        end
    end

    def check_out_guests(guest)
        return @guests.delete(guest)
    end

    def add_songs(song)
        return @playlist.push(song)
    end

end