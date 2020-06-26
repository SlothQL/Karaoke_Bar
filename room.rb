class Room

    attr_reader :playlist

    def initialize(playlist)
        @playlist = playlist
        @guests = []
    end

end