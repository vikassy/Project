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
    @actual = Array.new
    inf = Array.new
    f = Friendship.where(user_id: id, confirm: true )
    if !f.empty?
      f.each do |k|
        inf << k.viewer_id
      end
    end
    g = Friendship.where(viewer_id: id, confirm: true )      
    if !g.empty?
      g.each do |k|
        inf << k.user_id
      end
    end
    inf.each do |k|
      num = Hash.new
      num['id']= k
      num['name'] = User.find(k).name
      @actual << num
    end
    return @actual
  end


end
