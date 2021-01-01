class Admin::BaseController < ApplicationController

    layout 'backend'
    

    #prevent normal user see the backstage view
    before_action :authenticate_user!

end