class Admin::OrdersController < Admin::BaseController

    before_action :find_order, only:[:update]

    def index
        @orders = Order.order('created_at DESC')
    end


    def update

        if(@order.may_accept?)
            
            @order.accept!
            @order.update(shipment_status: :accpeted)
            redirect_to admin_orders_page, notice: "更新"

        end
        

    end


    private 
    def find_order
        @order = Order.find([:id])
    end
    
    def order_params
        params.require(:order).permit(:num, :receipent, :tel, :address, :note, :state, :paid_at, :shipment_status)
    end

end