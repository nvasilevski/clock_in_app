class SessionsController < ApplicationController
  include AuthenticationSystem

  def new
  end

  def create
    user = UserFinder.call(user_params[:login])

    if user
      log_in(user)
      flash[:success] = t('login.success')
      redirect_to root_path
    else
      flash[:danger] = t('login.failed')
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    session.delete(AuthenticationSystem::USER_ID_SESSION_KEY)
    redirect_to login_path
  end

  private

  def user_params
    params.require(:session).permit(:login)
  end
end