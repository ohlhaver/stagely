class SessionsController < ApplicationController
def new
end

def create
  auth = request.env["omniauth.auth"]
  user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
  session[:user_id] = user.id
  session[:auth] = auth

  #token = auth["credentials"]["token"]
  #user = FbGraph::User.new('me', :access_token => token)
  #user = user.fetch
  #me = FbGraph::User.me(token)
  #me.feed!(
  #:message => 'Updating via FbGraph')
  #session[:me] = FbGraph::User.me(token)

  redirect_to(session[:return_to] || root_url, :notice => "Signed in!")
end

def destroy
  session[:user_id] = nil
  redirect_to root_url, :notice => "Signed out!"
end



end
