class SessionsController < ApplicationController
  skip_before_action :authorize
  
  def new
  end

  def create
#=>  user = User.find_by(name: params[:name])
#=>  if user.try(:authenticate, params[:password])
#=>  session[:user_id] = user.id
#=>  redirect_to admin_url
#=>  else
#=>  redirect_to login_url, alert: "Invalid user/password combination"
#=>  end
    user = User.find_by(name: params[:name])
    if user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to admin_index_url #which url you use depends upon routes.rb
    else
      redirect_to login_url, notice: "Invalid user/password combination, methinks."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "You are now logged out."
  end
end
