module AuthenticationSystem
  USER_ID_SESSION_KEY = :current_user_id

  def log_in(user)
    session[USER_ID_SESSION_KEY] = user.id
  end
end