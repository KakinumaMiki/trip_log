class Prefectures::PlacesController < ApplicationController
  before_action :set_prefecture
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  def index
    @places = @prefecture.places
  end

  def show
  end

  def new
    @place = @prefecture.places.new
  end

  def edit
  end

  def create
    @place = @prefecture.places.build(place_params)

    if @place.save
      redirect_to prefecture_places_path(@prefecture), notice: '新規作成されました。'
    else
      render :new
    end
  end

  def update
    if @place.update(place_params)
      redirect_to prefecture_place_path(@prefecture, @place), notice: '更新されました。'
    else
      render :edit
    end
  end

  # DELETE /prefectures/1 or /prefectures/1.json
  def destroy
    if @place.destroy
      redirect_to prefecture_places_path(@prefecture), notice: '場所を削除しました。'
    else
      redirect_to prefecture_places_path(@prefecture), alert: '削除できませんでした。'
    end
  end

  private

  def set_prefecture
    @prefecture = Prefecture.find(params[:prefecture_id])
  end

  def set_place
    @place = @prefecture.places.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    params.require(:place).permit(:name, :address, :gone, :memo, :category_id)
  end
end
