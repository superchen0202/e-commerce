class Admin::ProductsController < Admin::BaseController

    before_action :find_product, only:[:edit, :update, :destroy]
    before_action :check_admin 

    def index
        @products = Product.order("created_at DESC").includes(:vendor, :category).page params[:page]
    end

    def new
        @product = Product.new
        @product.skus.build
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
        if @product.update(products_params)
            redirect_to edit_admin_product_path, notice: "商品資訊更新成功!"
        else
            render :edit
        end
    end

    def destroy

        @product.destroy
        redirect_to admin_products_path, notice: "刪除成功！"

    end


    # def delete_attachment
    #     @product_cover_image = ActiveStorage::Blob.find_signed(params[:id])
    #     @product_cover_image.purge_later
    #     redirect_to edit_admin_product_path, notice: "圖檔刪除成功!"
    # end

    private
    def find_product
        @product = Product.friendly.find(params[:id])
    end

    def check_admin

        unless current_user.admin?
            redirect_to root_path, notice: "您無權限查看管理者頁面"
        end
    end

    def products_params
        params.require(:product).permit(
                                            :name,
                                            :vendor_id,
                                            :list_price, 
                                            :sell_price, 
                                            :on_sell,
                                            :description,
                                            :category_id,
                                            :cover_image,
                                            skus_attributes: [:id, :spec, :quantity, :_destroy]
                                            
                                        )
    end

end