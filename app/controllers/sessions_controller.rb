class SessionsController < ApplicationController
    def new 
        redirect_to admin_litters_path if session[:user_id]
    end 
    
    def create
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to admin_litters_path
        else
            flash[:error] = "An error occured."  
            render 'new'
        end
    end 
end 