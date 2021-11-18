class Admin::OrdersController < Admin::BaseController

    before_action :find_order, only:[:update]

    def index
        @orders = Order.order('created_at DESC')
    end


    def update
        
        if(@order.may_deliver?)
            @order.deliver!
            flash[:notice] = "出貨中"
        end

        if(@order.may_pick?)
            @order.pick!
            flash[:notice] = "撿貨中"
        end
        
        redirect_to admin_orders_path

    end


    private 
    def find_order
        @order = Order.find(params[:id])
    end
    
    def order_params
        params.require(:order).permit(:num, :receipent, :tel, :address, :note, :state, :paid_at, :shipment_status)
    end

end