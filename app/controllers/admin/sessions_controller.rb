class Admin::SessionsController < Admin::BaseController
    def destroy 
        session.clear 
        redirect_to homepage_path
    end 
end 