class OrdersController < ApplicationController

    before_action :authenticate_user!

    def index
        @orders = current_user.orders.order(id: :desc)
    end

    def create
    
        @order = current_user.orders.build(order_params)

        current_cart.items.each do |item|
            @order.order_items.build(sku_id: item.sku_id, quantity: item.quantity)
        end

        # 訂單成立，轉付款頁面
        if @order.save
            #render json: params
            session[:cart_9527] = nil #clean the cart content
            redirect_to pay_path(@order), notice: "OK"
        else
            render "carts/checkout"
        end
    end 

    def total_price
        order_items.reduce(0) { |sum, item| sum + item.total_price }
    end
    

    private
    def order_params        
        params.require(:order).permit(:receipent, :tel, :address, :note)
    end

end