class SessionsController < ApplicationController

    def new
    end
    def create 
     user = User.find_by(email: params[:login][:email].downcase)
     if user && user.authenticate(params[:login][:password])
         session[:user_id] = user.id.to_s
         redirect_to root_path, notice: 'Successfully logged in!'
        
     else
         flash.now.alert = "Incorrect email"
         render :new 
     end
    end
    def destroy
        seession.delet(:user_id)
        redirect_to login_path, notice: "logged out!"
    end
end
