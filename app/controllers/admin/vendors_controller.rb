class Admin::VendorsController < Admin::BaseController

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
    end

    def destroy
    end


    def vendor_params
        params.require(:vendor).permit(:title, :description, :online)
    end

end