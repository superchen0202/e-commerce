class Cart

    #attr_reader :items

    def initialize
        @items = []
    end

    def items
        return @items
    end

    def add_items(product_id)
        
        @items.push(product_id)
        return @items
    end


    def emtpy?
       return  @items.empty?
    end

    
end