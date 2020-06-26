class Bar

    attr_reader :name, :till

    def initialize(name, till)
        @name = name
        @till = till
    end

    def rent_room(room, guest)
        room.check_in_guests(guest)
        guest.pay_fee(room)
        @till += room.entry_fee
    end

end