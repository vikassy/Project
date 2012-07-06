module FriendshipHelper

  def friend_request_any?
    f = Friendship.where(user_id: current_user.id, confirm: false )
    !f.empty?
  end
  
  #This function is there for checking weather id and current user are friends 
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

  def find_friends(id)
    n = Hash.new
    i = Array.new
    f = Friendship.where(user_id: id, confirm: true )
    i << f.viewer_id
    g = Friendship.where(viewer_id: id, confirm: true )      
    i << g.user_id
    i.each do |k|
      n << ['id' => k , 'name' => User.find(k).name]
    end
  end


end
