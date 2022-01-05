class SessionsController < ApplicationController
  def new
  end 

  def create
    user = User.find_by_email(params[:email])
    # If the user exists and the password entered is correct
    if user && user.authenticate(params[:password])
      # Save user id as cookie to keep them logged in
      session[:user_id] = user.id
      redirect_to :root
    else
    # If user's login doesn't work, send them back to the login form.
      render :new
    end
  end

  def destroy
  end
end
