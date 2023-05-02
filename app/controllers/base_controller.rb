class BaseController < ApplicationController
  before_action :authenticate_user!

  private

  def authenticate_user!
    return if current_user
    redirect_to login_path, alert: 'ログインしてください。'
  end
end
