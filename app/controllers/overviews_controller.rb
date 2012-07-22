class OverviewsController < UsersController
  include OverviewHelper
  include GeneralHelper
  include GroupsHelper
  include EventsHelper
  before_filter :signed_in_user? ,only: [:show]
  before_filter :correct_user? , only: [:show]

  def show
  	@grps = all_invitation_user(current_user.id,'g')
  	@evnts = all_invitation_user(current_user.id,'e')
  	@user = User.find(params[:id])
    @requests = Friendship.where(user_id: current_user.id , confirm: false )
  end


end
