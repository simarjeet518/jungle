class SessionsController < ApplicationController

  def new
  end

  def create  
    @error = false
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id 
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
