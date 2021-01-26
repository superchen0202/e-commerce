class CartItem

    attr_reader :product_id, :quantity

    def initialize(product_id, quantity)
        @product_id = product_id
        @quantity = quantity
    end

    def increament!( n = 1)
        @quantity = @quantity + n 
        return @quantity
    end

    
    def product
        return Product.find_by(id: product_id)
    end

    def amount
        return product.sell_price * @quantity
    end

end