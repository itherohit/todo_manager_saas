class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.all.map {|user| user.to_formatted_string}.join("\n")
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = User.create!(
      name: name,
      email: email,
      password: password,
    )
    render plain: "New User Created with the id #{new_user.id}"
  end

  def login
    email = params[:email]
    password = params[:password]
    if User.where("email = ? and password = ?", email,password).empty?
      render plain: "FALSE! Login FAILED."
    else
      render plain: "TRUE! Login SUCCESSFUL."
    end
  end
end
