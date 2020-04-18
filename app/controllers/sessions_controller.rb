class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_in 
    def create
        user=User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            redirect_to root_path
        else
            redirect_to users_path
        end
    end
end