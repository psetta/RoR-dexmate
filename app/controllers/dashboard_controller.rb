class DashboardController < ApplicationController

layout 'menu'

	def index
		@pageTipe = "dashboard"
		if user_is_logged_in?
			redirect_to root_url
		end	
	end
	
	def update
	  @user = User.find_by(idUser: session[:user_id]) 
      if @user && @user.authenticate(params[:password]) && !user_is_logged_in?

			if params[:newpassword] != "" and params[:repeatnewpassword] != ""
				@user.update(mail: params[:email], phone: params[:phone], defaultHeight: params[:height], password: params[:newpassword], password_confirmation: params[:repeatnewpassword])
			else
				@user.update(mail: params[:email], phone: params[:phone], defaultHeight: params[:height])
			end
			
			if params.has_key?(:photo)
				@user.update(avatar: params[:photo])
			end
			
		    session[:user_id] = @user.idUser
			session[:name] = @user.name
			session[:mail] = @user.mail
			session[:admin] = @user.admin
			
			if @user.avatar.file.exists?
				session[:avatar] = @user.avatar.url
			else
				session[:avatar] = "/default/avatar/default.png"
			end
			session[:height] = @user.defaultHeight
			session[:phone] = @user.phone
	
		redirect_to dashboard_url
      else
        render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
      end
	end
	
end
