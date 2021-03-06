class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.
      find_by(username: params[:username].downcase).
      try(:authenticate, params[:password])

    if @user
      session[:user_id] = @user.id
      redirect_to products_path
    else
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
