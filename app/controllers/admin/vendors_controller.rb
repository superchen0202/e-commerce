class Admin::VendorsController < Admin::BaseController
    
    before_action :find_vendor, only:[:edit, :update, :destroy]

    def index
        @vendors = Vendor.order('created_at DESC')
    end

    def show
    end

    def new
        @vendor = Vendor.new
    end

    def create
        @vendor = Vendor.create(vendor_params)

        if @vendor.save
            redirect_to admin_vendors_path, notice:"廠商新增成功"
        else
            render :new
        end
    end 

    def edit
        
    end

    def update

        if @vendor.update(vendor_params)
            redirect_to edit_admin_vendor_path, notice: "更新成功"
        else
            render :edit
        end

    end

    def destroy
    end

    private
    def vendor_params
        params.require(:vendor).permit(:title, :description, :online)
    end

    def find_vendor
        @vendor = Vendor.find(params[:id])
    end

end