class PayController < ApplicationController

    def new
    end

    def show
        @order = Order.find(params[:id])
        @order_total_price = 0;

        @order.order_items.each do |order_item|
            @order_total_price = @order_total_price + order_item.quantity * order_item.sku.product.sell_price
        end

        @client_token = gateway.client_token.generate

    end

    def payment
        
        #Test for get the nonce from braintree or not
        #render html: params
        @order = Order.find(params[:id])
 
        result = gateway.transaction.sale(
          amount: @order.total_price,
          payment_method_nonce: params[:payment_nonce],
          options: {
            submit_for_settlement: true
          }
        )

        if  result.success? && @order.state != "paid"

            @order.pay!
            session[:cart_9527] = nil       #clean the cart content
            redirect_to root_path, notice: '付費成功'
            
        else        
            redirect_to root_path, notice: '付費發生錯誤'
        end

    end
    
    private
    def gateway
        
        return gateway = Braintree::Gateway.new(

            :environment => :sandbox,
            :merchant_id => ENV["merchant_id"],
            :public_key => ENV["public_key"],
            :private_key => ENV["private_key"],
        )

    end

end