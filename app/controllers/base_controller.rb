class BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user

  private

  def authenticate_user!
    return if current_user
    redirect_to login_path, alert: 'ログインしてください。'
  end

  # あと、openでも他の人が作った時は、編集とか、記録の追加とかはできないようにする
  def check_user
    if params[:place_id]
      place = Place.find(params[:place_id])
      return if place.user == current_user || place.open?
      redirect_to prefectures_path
    end

    if params[:plan_id]
      plan = Plan.find(params[:plan_id])
      return if plan.user == current_user || plan.open?
      redirect_to prefectures_path
    end
  end
end
