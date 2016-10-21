class SessionsController < ApplicationController
  def new
  end

  def login
  	user = User.where(email: params[:email]).first
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to "/events"
  	else
  		flash[:errors] = 'Invalid Login'
  		redirect_to "/"
  	end
  end

  def logout
  	session[:user_id] = nil
  	redirect_to '/'
  end

end


