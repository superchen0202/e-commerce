class Admin::CategoriesController < Admin::BaseController

    before_action :find_category, only:[:edit, :update, :destroy]

    def index
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
    end

    def destroy
    end

    private 

    def find_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end

end