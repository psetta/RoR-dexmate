class WelcomeController < ApplicationController
layout 'welcome'
  def index
	if (user_id = cookies.signed[:user_id])
      user = User.find_by(idUser: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
	end
	if !user_is_logged_in?
		redirect_to calendar_url
	end
  end

  def login
    user = User.find_by(name: params[:session][:user]) 
      if user && user.authenticate(params[:session][:password])
        #This log the user
        log_in user
		if params[:remember_me] == "1"
			remember(user)
		else
			forget(user)
		end

        redirect_to calendar_url
      else
        render :file => "#{Rails.root}/public/404.html",  :status => 404
    end
  end

  def destroy
    log_out
    redirect_to root_url

  end
end

