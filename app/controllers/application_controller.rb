class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include WelcomeHelper

  def user_is_logged_in?
    !session[:user_id]
  end
end
