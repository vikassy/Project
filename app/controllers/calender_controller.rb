class CalenderController < ApplicationController 
 
  def calender
    @title = "Calender"
    if params[:id].nil?
      @usr = current_user
    else 
      @usr = User.find(params[:id])
    end
     # @cal = @usr.calender
  end

end
