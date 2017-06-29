class AdminController < ApplicationController
layout 'menu'
  def index
    if  !user_is_logged_in? and session[:admin] == 1
      @pageTipe = "admin"
      @users = User.all
    else
        redirect_to root_url
    end
  end
  
  def create
    if  !user_is_logged_in? and session[:admin] == 1
	  user = User.new(name: params[:name], mail: params[:email], admin: params[:admin], phone: params[:phone], password: params[:pass], password_confirmation: params[:pass])
	  user.save
    else
        render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
    end
  end
  
  def destroy
    if  !user_is_logged_in? and session[:admin] == 1
	  user = User.destroy(params[:id])
	  
      redirect_to admin_url
    else
        render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
    end

  end
  
  def update
		@user = User.find_by(idUser: params[:id])
        if @user && !user_is_logged_in? and session[:admin] == 1
		@user.update(mail: params[:email], phone: params[:phone], password: params[:pass], password_confirmation: params[:pass], admin: params[:admin] )
		
      else
        render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
      end
  end
end
