class Api::V1::UtilsController < ApplicationController

    def subscribe
        email = params["subscribe"]["email"]

        sub = Subscribe.new(email: email)
        
        if sub.save
            render json:{ status: "OK", email: email}
        else        
            render json:{ status: "Duplicated", email: email}
        end 
    end

end