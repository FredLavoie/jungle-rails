class SessionsController < ApplicationController

  def create
    if User.authenticate_with_credentials(params[:email], params[:password])
      user = User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/login'
    end

    # this is funky af yeah seriously wtf is going on

  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end

