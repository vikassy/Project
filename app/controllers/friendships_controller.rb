class FriendshipsController < ApplicationController

  def create
    Friendship.create!(sent_req: true , confirm: false , viewer_id: current_user.id , user_id: params[:id])
    flash['success']='Friend Request sent'
    redirect_to User.find(params[:id])
  end

  def update 
    f = Friendship.where(user_id: current_user.id , viewer_id: params[:id])
    f[0].update_attributes(confirm: true)
    redirect_to User.find(params[:id])
  end

  def destroy
    f = Friendship.where(user_id: current_user.id , viewer_id: params[:id])
    if f.empty?
    f = Friendship.where(user_id: params[:id] , viewer_id: current_user.id)
    end
    Friendship.destroy(f[0].id)
    redirect_to overview_path(current_user.id)
  end
  
end
