class CartsController < ApplicationController

    before_action :authenticate_user!

    # return current_cart
    def show
    end

    def new
    end
    
    def create
    end

    def destroy
        session[:cart_9527] = nil
        redirect_to cart_path, notice: '購物車已清空'
    end

    
    def checkout
    end

end