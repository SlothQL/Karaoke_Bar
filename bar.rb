class Bar

    attr_reader :name, :till

    def initialize(name, till)
        @name = name
        @till = till
    end

    def rent_room(room, guest)
            phrase = room.check_in_guests(guest)
            if (phrase == "I am sorry, but our room has only space for 3 people.")
                return
            else
                guest.pay_fee(room)
                @till += room.entry_fee
            end
    end

end