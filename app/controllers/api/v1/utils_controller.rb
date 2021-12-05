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

        # old version for add_items
        #product = Product.friendly.find(params[:product_id])

        sku = Sku.find_by(skus:{ id: params[:product_skus]})
        product = Product.joins(:skus).find_by(skus:{ id: params[:product_skus]})
        
        @product_to_buy = params[:product_quantity].to_i
        @product_left = sku.quantity - @product_to_buy 

        if (product != nil && @product_left >=0 )
            
            current_cart.add_sku(params[:product_skus], params[:product_quantity])
            session[:cart_9527] = current_cart.to_hash

            sku.update(quantity: @product_left)

            render json: { status: "OK", items: current_cart.items.count, sku_left: @product_left }
    
        else
            render json: { status: "X_X" }
        end
      
    end

    def spec_sync 

        sku = Sku.find_by(skus: {id: params[:sku_id]})

        if sku != nil
            
            render json:{
                status: "OK",
                spec: sku.spec,
                quantity: sku.quantity
            }

        else
            render json:{ 
                status: "X"
            }

        end

    end

end