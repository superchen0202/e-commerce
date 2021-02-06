class CartItem

    attr_reader :sku_id, :quantity

    def initialize(sku_id, quantity = 1)
        @sku_id = sku_id
        @quantity = quantity
    end

    def increment!( n = 1)
        
        @quantity =  @quantity +  n 

    end

    def product

        #黑人問號???
        #Product.friendly.find(product_id)
        #Product.friendly.find(sku_id)
        Product.joins(:skus).find_by(skus: { id: sku_id })
        
    end

    def amount
        return product.sell_price * @quantity
    end

end