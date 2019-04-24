class Admin::SessionsController < Admin::BaseController
    def destroy 
        redirect_to homepage_path
        session.clear 
    end 
end 