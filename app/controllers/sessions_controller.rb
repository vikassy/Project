class SessionsController < ApplicationController

  def new 
  
  end

  def create 
    user = User.find_by_email(params[:sessions][:email])
    if user && user.authenticate(params[:sessions][:password])
      sign_in user
      return_to_back(overview_path(user.id))
    else
      flash[:error]='Invalid email and password Combination !'
      render 'new'
    end

  end 

  def destroy  
    sign_out
    redirect_to root_path
  end 

end
