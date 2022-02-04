class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    @error = false
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      # only asking authorization when user trying to checkout then after login redirected to same view
      redirect_to '/cart'
    else
      @error = true
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
