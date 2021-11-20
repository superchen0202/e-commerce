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

        product = Product.joins(:skus).find_by(skus:{ id: params[:product_skus]})


        if product != nil
            
            current_cart.add_sku(params[:product_skus], params[:product_quantity])
            session[:cart_9527] = current_cart.to_hash
            
            render json: { status: "OK", items: current_cart.items.count }
    
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