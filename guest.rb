class Guest

    attr_reader :name, :age, :money

    def initialize(name, age, money)
        @name = name
        @age = age
        @money = money
    end

    def pay_fee(room)
        if enough_money?(room)
            @money -= room.entry_fee()
        end
    end

    def enough_money?(room)
        return @money >= room.entry_fee()
    end

end