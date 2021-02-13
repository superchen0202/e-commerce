class OrdersController < ApplicationController

    before_action :authenticate_user!


    def create

        @order = current_user.orders.build(order_params)

        current_cart.items.each do |item|
            @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)
        end

        if @order.save
            render html: params
            #redirect_to orders_path, notice: "OK"
        else
            render "carts/checkout"
        end
    end

    private

    def order_params        
        params.require(:order).permit(:receipent, :tel, :address, :note)
    end
    
end