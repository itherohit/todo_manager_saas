class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    render "index"
  end
  def new
    render "new"
  end
  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password]
    )
    redirect_to root_path
  end
end
