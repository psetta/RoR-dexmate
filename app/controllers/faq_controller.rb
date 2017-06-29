class FaqController < ApplicationController
layout 'menu'
  def index
    @pageTipe = "faq"
    if user_is_logged_in?
      redirect_to root_url
    end
  end

end
