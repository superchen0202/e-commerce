class CartItem

    attr_reader :product_id, :quantity

    def initialize(product_id, quantity)
        @product_id = product_id
        @quantity = quantity
    end

    def increament!( n = 1)
        @quantity = @quantity + n 
    end


end