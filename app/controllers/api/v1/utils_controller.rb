class Api::V1::UtilsController < ApplicationController

    # subscribe api
    def subscribe
        email = params["subscribe"]["email"]

        sub = Subscribe.new(email: email)
        
        if sub.save
            render json:{ status: "OK", email: email}
        else        
            render json:{ status: "Duplicated", email: email}
        end 
    end

    # cart api
    def cart

        product = Product.friendly.find(params[:product_id])

        if product != nil
            
            cart = Cart.from_hash(session[:cart_9527])
            cart.add_items(product.code, params[:product_quantity])
            session[:cart_9527] = cart.to_hash
            
            render json: { status: "OK", items: cart}
    
        else
            render json: { status: "X_X" }
        end
      
    end

end