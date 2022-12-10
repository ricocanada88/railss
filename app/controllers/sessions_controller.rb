class SessionsController < ApplicationController

    def new
    end

    def create
        user = User.find_by(email: params[:email])

        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id

            redirect_to root_path, notice: "Success Login"
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end
        
    end
    
    def destroy
        if session[:user_id]
            session[:user_id] = nil
            redirect_to root_path, notice: "Loggoed out"
        end
    end

end
