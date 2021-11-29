require "pry"


class CashRegister

    attr_accessor :discount, :total, :items, :last_transaction, :last_item

    def initialize(discount = 0, total = 0, items = [])
        @discount = discount
        @total = total
        @items = items
    end

    def add_item(title, price, quantity = 1)
        @total = total + price * quantity
        quantity.times do 
            @items << title
        end
        @last_transaction = price * quantity
    end

    def apply_discount
        case self.discount
        when 0
            "There is no discount to apply."
        else
            @total = total * ((100 - self.discount.to_f) / 100.0)
            "After the discount, the total comes to $#{total.to_i}."
        end
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end

end

binding.pry
0