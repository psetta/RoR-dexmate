class HealthController < ApplicationController
layout 'menu'
	def index

	    if user_is_logged_in?
      		redirect_to root_url
		else
			@pageTipe = "health"
			@healthChart = ModHealth.where(idUser_fk: session[:user_id]).order(:date)
			
			if @healthChart.count() > 0
				@startDate =  @healthChart.first.date.to_datetime
				@startDate = @startDate.day.to_s + '/' + @startDate.month.to_s + '/' + @startDate.year.to_s

				@endDate =  @healthChart.last.date.to_datetime
				@endDate = @endDate.day.to_s + '/' + @endDate.month.to_s + '/' + @endDate.year.to_s
			end
			
    	end
	end
	
	def create
		if user_is_logged_in?
      		render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
		else
			@date = DateTime.strptime(params[:date], '%d/%m/%Y').to_s(:db)
			@height = params[:height].to_f
			@imc = (params[:weight].to_f / (params[:height].to_f * params[:height].to_f))
			health = ModHealth.new(weight: params[:weight], pressureHigh: params[:pressureHigh], pressureLow: params[:pressureLow], imc: @imc, height: params[:height], idUser_fk: session[:user_id], date: @date)
			health.save
			redirect_to health_url
		
    	end
	end
	
	def dataRange
	
		if user_is_logged_in?
      		render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
		else
			@pageTipe = "health"
			
			@startDate = DateTime.strptime(params[:start], '%d/%m/%Y').to_s(:db)
			@endDate = DateTime.strptime(params[:end], '%d/%m/%Y').to_s(:db)
			
			@healthChart = ModHealth.where(idUser_fk: session[:user_id], :date => @startDate..@endDate).order(:date)
			
			if params[:weight] == '1'
	    		@weight = 1
	  		else
	    		@weight = 0
	  		end
	  
	        if params[:imc] == '1'
	    		@imc = 1
	  		else
	    		@imc = 0
	  		end
	  		
	        if params[:high] == '1'
	    		@high = 1
	  		else
	    		@high = 0
	  		end
	  
	        if params[:low] == '1'
	    		@low = 1
	  		else
	    		@low = 0
	  		end
	  
	  		@startDate =  @startDate.to_datetime
			@startDate = @startDate.day.to_s + '/' + @startDate.month.to_s + '/' + @startDate.year.to_s

			@endDate =  @endDate.to_datetime
			@endDate = @endDate.day.to_s + '/' + @endDate.month.to_s + '/' + @endDate.year.to_s
			
    	end

	end
	
	def destroy
		if  !user_is_logged_in?
			ModHealth.destroy(params[:date])
			redirect_to health_url
		else
			render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
		end

  end
  
  
	
end