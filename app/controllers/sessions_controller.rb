class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_in 
    def create
        user=User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            redirect_to root_path
        else
            flash[:error] = "Your Login was Invalid. Retry!"
            redirect_to new_signin_path
        end
    end

    def destroy
        session[:current_user_id]=nil
        @current_user = nil
        redirect_to root_path
    end
end