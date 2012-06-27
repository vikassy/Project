class CalenderController < ApplicationController 
 
  def calender
    @title = "Calender"
    if params[:date]
	    if params[:date][:month]
		    @month = params[:date][:month].to_i
		  end
		  if params[:date][:year]
		   	@year = params[:date][:year].to_i
		  end
		else
			@year = Time.now.year
			@month = Time.now.month
		#	@month = 2
		end
		#@usr = User.find(@month)
		#respond_to do |f|
		#	f.html {render 'calender'}
		#	f.js {render :content_type => 'text/javascript'}
		#end

  end

  def day
  	@title = 'Day |'+params[:id]
  end

end
