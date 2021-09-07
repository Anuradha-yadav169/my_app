class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = "Welcome"
            redirect_to @user
        else
            render 'new'
        end 
       # @user = User.new(user_params)
        #@user.email.downcase!

        #if @user.save
            #flash[:notice] = "Account created successfully!"
            #redirect_to root_path
        #else 
            #flash.now.alert = "couldn't created"
            #render :new
            
        #end
    end
private 
 def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
 end
end
