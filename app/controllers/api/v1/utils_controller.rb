class Api::V1::UtilsController < ApplicationController

    # subscribe api
    def subscribe
        email = params["subscribe"]["email"]

        sub = Subscribe.new(email: email)
        
        if sub.save
            render json:{ status: "OK", email: email}
        else        
            render json:{ status: "Duplicated", email: email}
        end 
    end

    # cart api
    def cart
        render json: params
    end

end