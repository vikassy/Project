module OverviewHelper 

  def get_name(id)
    User.find(id)
  end

end
