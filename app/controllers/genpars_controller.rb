class GenparsController < UsersController

	include FriendshipHelper 

	def friends 
		@friends = find_friends(current_user.id)
	#@friends = User.all
	end

end
