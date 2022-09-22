class Prefectures::PlacesController < ApplicationController
  def index

  end

  def show

  end

  def new
    @place = Place.new
  end

  def edit
  end

  def create
    @place = Place.new(prefecture_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to prefecture_places_url(@place), notice: "Place was successfully created." }
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
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
  # Use callbacks to share common setup or constraints between actions.
  def set_place
    # @place = Place.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def place_params
    # params.require(:prefecture).permit(:name)
  end
end
