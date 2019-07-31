module AdminHelper
  # Just for simplification, we should not load all users in memory
  # For real case some kind of user search must be implemented
  def users_collection
    User.all.pluck(:fullname, :id)
  end
end