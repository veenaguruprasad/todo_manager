class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def show
    id = params[:id]
    render plain: User.find(id).to_displayable_string
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password]
    user = User.create!(first_name: first_name, last_name: last_name, email: email, password: password)
    session[:current_user_id] = user.id
    redirect_to "/"
  end
end
