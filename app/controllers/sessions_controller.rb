class SessionsController < ApplicationController

  def new
  end

  def create    
    if @user = User.login(params[:email])
      login(@user)
      if session[:back_to].present?
        back_to = session[:back_to]
        session[:back_to] = nil
        redirect_to back_to
      else
        redirect_to root_path
      end
    else
      flash.now[:notice] = "Ooops! Looks like you have not registered yet."

      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
