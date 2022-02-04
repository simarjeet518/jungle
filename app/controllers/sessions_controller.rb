class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      # only asking authorization when user trying to checkout then after login redirected to same view
      redirect_to '/cart'
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
