class Cart

    #attr_reader :items
    #初始化和取得實體變數值的基本設定
    def initialize( items = [])
        @items = items
    end

    def items
        return @items
    end

    #購物車提供的相關方法

    def add_items(product_id, quantity = 1)
   
        # My version
        # @items.each do |cart_item|
        #     if cart_item.product_id == product_id
        #         cart_item.increament!(quantity)
        #     else
        #         @items.push(CartItem.new(product_id, quantity)) # cart.items.first.product_id
        #     end
        # end

        # return @items


        #Teacher's version
        found = @items.find{ |cart_item| cart_item.product_id == product_id}
        
        if found
            found.increment!(quantity)
        else
            @items.push(CartItem.new(product_id, quantity)) # cart.items.first.product_id
        end

    end

    def emtpy?
       return  @items.empty?
    end

    def total_price
        
        # @items.reduce(0) { |sum, item| sum = sum + item.amount }

        total_amount = 0

        @items.each do |item|
           total_amount = total_amount + item.amount
        end

        return total_amount
    end

    # To determine the special day for business discount 
    def special

        t = Time.now
        res =""              # res = t.strftime("%m/%d")
        
        if t.strftime("%m/%d") == "12/25"
            res = "Nice"
        else
            res = "bad"
        end

        return res
    end

    # [] => {}
    def to_hash

        # items = @items.map{ |item| {"product_id": item.product_id, "quantity": item.quantity}}
        # return cart_hash = {"items": items}
        
        item_content = []
        
        items.each do |item|
            item_content << { "product_id"=> item.product_id, "quantity"=> item.quantity}
        end

        cart_hash_type = { "items"=> item_content}

        return cart_hash_type

    end

    # {} => []
    def self.from_hash(cart_hash_type = nil)

        if cart_hash_type && cart_hash_type["items"]

            #cart_array = Cart.new

            # cart_hash[:items].each do |item|
            #     cart_array.items.push(CartItem.new(item[:product_id], item[:quantity]))
            # end

            # return cart_array

            items = cart_hash_type["items"].map { |item| 
                CartItem.new(item["product_id"], item["quantity"])
            }

            return Cart.new(items)

        else
            Cart.new
        end
        
    end

end