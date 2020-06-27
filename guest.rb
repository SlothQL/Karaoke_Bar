class Guest

    attr_reader :name, :age, :money, :favourite_song

    def initialize(name, age, money, favourite_song)
        @name = name
        @age = age
        @money = money
        @favourite_song = favourite_song
    end

    def pay_fee(room)
        if enough_money?(room)
            @money -= room.entry_fee()
        end
    end

    def enough_money?(room)
        return @money >= room.entry_fee()
    end

    def favourite_song_in_room(room)
        if room.is_song_in_playlist?(@favourite_song)
            return "Wohoo!" 
        else
            return "We are sorrv but '#{@favourite_song.title}' is not in the playlist."
        end
    end

end