class ApplicationController < ActionController::Base

    before_action :find_category, unless: :backend?
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def record_not_found
        
        render file: "#{Rails.root}/public/404.html",
        layout: false,
        status: false
        
    end

    def backend?
        controller_path.split('_').first == "admin"
    end

    def find_category
        @categories = Category.order(position: :asc)
    end

end