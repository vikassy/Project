class OverviewsController < UsersController
include OverviewHelper
include GroupsHelper
include EventsHelper
  before_filter :signed_in_user? ,only: [:show]
  before_filter :correct_user? , only: [:show]

  def show
  	@grps = invitation_grps(current_user.id)
  	@evnts = invitation_evnts(current_user.id)
  	@user = User.find(params[:id])
    @requests = Friendship.where(user_id: current_user.id , confirm: false )
  end


end
