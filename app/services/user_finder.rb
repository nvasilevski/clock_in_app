class UserFinder
  def self.call(login)
    User.where(login: login).or(User.where(fullname: login)).first
  end
end