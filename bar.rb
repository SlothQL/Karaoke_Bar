class Bar

    attr_reader :name, :till

    def initialize(name, till)
        @name = name
        @till = till
    end

    def guest_cannot_pay_fee(room, guest)
        return !guest.enough_money?(room)
    end

    def room_has_space?(room)
        return room.capacity > room.count_guests()
    end

    def rent_room(room, guest)
        return if guest_cannot_pay_fee(room, guest)
        return if !room_has_space?(room)
        if (room_has_space?(room))
            guest.pay_fee(room)
            @till += room.entry_fee
            room.check_in_guests(guest) 
        end
    end

end