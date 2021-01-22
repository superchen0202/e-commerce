class Cart

    #attr_reader :items

    def initialize
        @items = []
    end

    def items
        return @items
    end

    def add_items(product_id, quantity = 1)
        
        found = @items.find{|cart_item| cart_item.product_id == product_id}

        if found
            found.increament!(quantity)
        else
            @items.push(CartItem.new(product_id, quantity))
        end

        return @items
    end


    def emtpy?
       return  @items.empty?
    end

    
end