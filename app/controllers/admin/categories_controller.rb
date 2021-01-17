class Admin::CategoriesController < Admin::BaseController

    before_action :find_category, only:[:edit, :update, :destroy]

    def index
        @categories = Category.order(created_at: "DESC")
    end

    def new
        @category = Category.new

    end

    def create
        @category = Category.new(category_params)

        if @category.save
            redirect_to admin_categories_path, notice: "新增成功"
        else
            render :new
        end
    end

    def edit
    end

    def update

        if @category.update(category_params)
            redirect_to edit_admin_category_path(@category), notice: "更新成功!"
        else
            render :edit
        end
    end

    def destroy
        @category.destroy
        redirect_to admin_categories_path, notice: "刪除成功！"
    end




    private 

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end

end