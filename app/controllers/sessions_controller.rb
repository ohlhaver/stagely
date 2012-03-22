class SessionsController < ApplicationController
def new
end

def create
  auth = request.env["omniauth.auth"]
  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  session[:user_id] = user.id
  redirect_to root_url, :notice => "Signed in!"
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Signed out!"
end

def old_create
  user = User.find_by_email(params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Logged in!"
  else
    flash.now.alert = "Email or password is invalid"
    render "new"
  end
end

def old_destroy
  session[:user_id] = nil
  redirect_to "sessions#create", notice: "Logged out!"
end


end
