class RegistersController < ApplicationController
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path, notice: "Success"
        else 
            render :new
            # render plain: @user.inspect
        end
    end

    private 
        def user_params
            params.require(:user).permit(:email, :password, :password_confirmation)
        end
end
