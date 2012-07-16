class PagesController < ApplicationController
  def home
    if signed_in?
      redirect_to overview_path(current_user)
    else
      @all_images = ["box-logo.jpg","rails.png"].to_json.html_safe
      @title = 'Home'
      @user = User.new
    end
  end

  def about
    @title = 'About'
  end

  def help
    @title = 'Help'
  end
end
