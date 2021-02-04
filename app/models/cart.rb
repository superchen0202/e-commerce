class Cart

    #初始化和取得實體變數值的基本設定
    # attr_reader :items

    def initialize( items = [])
        @items = items
    end

    def items
        return @items
    end

    # {} => []
    def self.from_hash(cart_hash_type = nil)

        if cart_hash_type && cart_hash_type["items"]


            #
            #---Hash format to reference---
            #
            # {
            #  "items" => [ {"product_id" => 2, "quantity" => 3}, {"product_id" => 4, "quantity" => 7}]
            # }

            #----My Version---
            
            cart_array_type = Cart.new

            cart_hash_type["items"].each do |item|
                cart_array_type.items.push( CartItem.new(item["product_id"], item["quantity"]) )
            end

            return cart_array_type

            # ---Teacher's Version---

            # items = cart_hash_type["items"].map { |item| 
            #     CartItem.new(item["product_id"], item["quantity"])
            # }

            # Cart.new(items)

        else
            Cart.new
        end
        
    end

    # [] => {}
    def to_hash

        #---My Version---
        # items = @items.map{ |item| {"product_id"=> item.product_id, "quantity"=> item.quantity}}
        # return cart_hash = {"items"=> items}
        
        # --- My Version ---
        item_content = []
        
        items.each do |item|
            item_content << { "product_id"=> item.product_id, "quantity"=> item.quantity}
        end

        cart_hash_type = { "items"=> item_content}

        return cart_hash_type
        
        #---Teacher's Version---
        # items = @items.map { |item| {"product_id" => item.product_id, 
        # "quantity" => item.quantity} }
        
        # { "items" => items }

    end


    #購物車提供的相關方法
    def add_items(product_id, quantity = 1)
   
        #Teacher's version
   
        quantity = quantity.to_i
   
        found = @items.find{ |cart_item| cart_item.product_id == product_id}
        
        if found
            found.increment!(quantity)
        else
            @items.push(CartItem.new(product_id, quantity)) # cart.items.first.product_id
        end

        return @items

    end

    def empty?
       return  @items.empty?
    end

    def total_price
        
        #--- Shorted version---
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

end