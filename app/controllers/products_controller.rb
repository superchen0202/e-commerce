class ProductsController < ApplicationController

    def index
        @products = Product.order(updated_at: :asc).includes(:vendor)
    end

    def show
    end

end