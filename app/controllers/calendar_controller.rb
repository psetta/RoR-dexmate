class CalendarController < ApplicationController
layout 'menu'
  def index
    if user_is_logged_in?
      redirect_to root_url
	else
	  @pageTipe = "calendar"
	  @eventsOnCalendar = ModCalendar.where(idUser_fk: session[:user_id])
	  
	  @eventsOnCalendar.each do |event|
	  
		dateS = event.date.to_datetime
		
		event.startDay = dateS.day
		event.startMonth = dateS.month
		event.startYear = dateS.year
		event.startHour = dateS.hour
		event.startMin = dateS.min
		
		dateE = event.dateF.to_datetime
		event.endDay = dateE.day
		event.endMonth = dateE.month
		event.endYear = dateE.year
		event.endHour = dateE.hour
		event.endMin = dateE.min

      end
	  
    end
  end

  def create
    if user_is_logged_in?
		render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
    else
		if params[:rep] == '1'
			rep = 1
		else
			rep = 0
		end

		@dates = params[:daterange].split(' - ')
		
		@firstDate = DateTime.strptime(@dates[0], '%d/%m/%Y %H:%M').to_s(:db)
		@secondDate = DateTime.strptime(@dates[1], '%d/%m/%Y %H:%M').to_s(:db)

		event = ModCalendar.new(date: @firstDate, anualRep: rep, category: params[:type], dateF: @secondDate, name: params[:title], web: params[:web], idUser_fk: session[:user_id], text: params[:text], color: params[:color])
		event.save
			
		if params.has_key?(:photo)
			event.update(photo: params[:photo])
		end
		
		redirect_to calendar_url
    end
  end

  def update
      if user_is_logged_in?
      render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
    else
		event = ModCalendar.find_by(idcalendar: params[:idcalendar])

		@dates = params[:daterange].split(' - ')

		event.update(date: @dates[0], anualRep: params[:rep], category: params[:category], dateF: @dates[1], name: params[:title], web: params[:web], idUser_fk: session[:user_id], text: params[:text], color: params[:color])
	
		redirect_to calendar_url
    end
  end
  
  def destroy
    if  !user_is_logged_in?
	  event = ModCalendar.destroy(params[:id])
    else
        render :file => "#{Rails.root}/public/404.html",  :status => 404, :layout => false
    end

  end
end
