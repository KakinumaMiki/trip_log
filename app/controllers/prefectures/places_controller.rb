class Prefectures::PlacesController < ApplicationController
  before_action :set_prefecture
  def index
    @places = @prefecture.places
  end

  def show
    @place = @prefecture.places.find(params[:id])
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
    # respond_to do |format|
    #   if @prefecture.update(prefecture_params)
    #     format.html { redirect_to prefecture_url(@prefecture), notice: "Prefecture was successfully updated." }
    #     format.json { render :show, status: :ok, location: @prefecture }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @prefecture.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /prefectures/1 or /prefectures/1.json
  def destroy
    @place.destroy

    respond_to do |format|
      format.html { redirect_to prefectures_url, notice: "Prefecture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_prefecture
    @prefecture = Prefecture.find(params[:prefecture_id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    params.require(:place).permit(:name, :address, :gone, :memo, :category_id)
  end
end
