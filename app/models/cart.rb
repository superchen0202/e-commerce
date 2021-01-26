class Cart

    #attr_reader :items
    #初始化和取得實體變數值的基本設定
    def initialize
        @items = []
    end

    def items
        return @items
    end


    #購物車提供的相關方法

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

    def total_price
        
        total = 0

        @items.each do |item|
           total = total_amount + item.amount
        end

        return total
        
    end
    
end