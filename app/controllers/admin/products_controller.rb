class Admin::ProductsController < Admin::BaseController

    before_action :find_product, only:[:edit, :update, :destroy]

    def index
        @products = Product.all
    end

    def new
        @product = Product.new
    end

    def create

        @product = Product.new(products_params)
        
        if @product.save
            redirect_to admin_products_path, notice: "商品新增成功！"
        else
            render :new
        end
    end 

    def edit
        
    end

    def update
    end

    def destroy
    end

    private
    def find_product
        product = Product.friendly.find(params[:id])
    end

    def products_params
        params.require(:product).permit(
                                            :name,
                                            :vendor_id,
                                            :list_price, 
                                            :sell_price, 
                                            :on_sell
                                        )
    end

end