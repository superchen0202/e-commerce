class ProductsController < ApplicationController

    def index
        @products = Product.order(updated_at: :asc).includes(:vendor)
    end

    def show
        @product = Product.friendly.find(params[:id])
    end

end