class UsersController < ApplicationController 

include FriendshipHelper
before_filter :signed_in_user? , only: [:edit , :update]
before_filter :correct_user? , only: [:edit , :update]

  def index 
    @user = User.all
  end

  def new 
    @title = 'Sign up'
    @user = User.new
  end
   
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success]='You have been registered Please confirm through your email' 
      # Send confirmation email and redirect to login page and generate a random 
      # redirect to login page 
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit 
    @user = User.find(params[:id])
  end

  def update 
    @user = User.find(params[:id])
    if params[:user][:email] != @user.email 
      if @user.update_attributes(params[:user],terms_of_services: true)
	#call confirm_email function 
	sign_in @user
        flash[:success]='Your seetings have been updated , please confirm your email address'
        redirect_to @user
      else 
       render 'edit'
      end
    else
      if @user.update_attributes(params[:user],terms_of_services: true)
        sign_in @user
        flash[:success]='Your settings have been updated'
        redirect_to @user
      else
 	render 'edit'
      end
    end
  end
  
  def show
    a = Array.new
    @user = User.find(params[:id])
    @f = Friendship.where(user_id: @user.id , confirm: true)
    @f.each do |k|
    a.append(k.viewer_id)
    end 
    @g = Friendship.where(viewer_id: @user.id , confirm: true)
    @g.each do |f|
    a.append(f.user_id)
    end 
    @h = a.uniq
  end

private
  def signed_in_user?
    redirect_to signin_path , notice: 'Please Sign in.' unless signed_in?
  end

  def correct_user?
    @user = User.find(params[:id])
    redirect_to root_path , notice: 'Sorry You cannot access it.' unless current_user?(@user)
  end
end

