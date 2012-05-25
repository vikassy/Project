module FriendshipHelper

  def friend_request_any?
    f = Friendship.where(user_id: current_user.id, confirm: false )
    !f.empty?
  end

  def friends(id)

    f = Friendship.where(user_id: current_user.id, viewer_id: id, confirm: true )
    g = Friendship.where(user_id: id, viewer_id: current_user.id, confirm: true )

    if !f.empty? or !g.empty?
      return true
    else
      return false
    end

  end

  def request_sent_accept_friend(id)
    f = Friendship.where(user_id: current_user.id , viewer_id: id , confirm: false)
    !f.empty?
  end

  def request_sent(id)
    g = Friendship.where(user_id: id , viewer_id: current_user.id , confirm: false)
    !g.empty?
  end


end
