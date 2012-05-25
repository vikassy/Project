class OverviewsController < UsersController
include OverviewHelper
  before_filter :signed_in_user? ,only: [:show]

  def show
    @user = User.find(params[:id])
    @requests = Friendship.where(user_id: current_user.id , confirm: false )
  end


end
