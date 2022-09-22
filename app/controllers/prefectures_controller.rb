class PrefecturesController < ApplicationController
  before_action :set_prefecture, only: %i[ show edit update destroy ]

  # GET /prefectures or /prefectures.json
  def index
    @prefectures = Prefecture.all
  end

  # GET /prefectures/1 or /prefectures/1.json
  def show
  end

  # GET /prefectures/new
  def new
    @prefecture = Prefecture.new
  end

  # GET /prefectures/1/edit
  def edit
  end

  # POST /prefectures or /prefectures.json
  def create
    @prefecture = Prefecture.new(prefecture_params)

    respond_to do |format|
      if @prefecture.save
        format.html { redirect_to prefecture_url(@prefecture), notice: "Prefecture was successfully created." }
        format.json { render :show, status: :created, location: @prefecture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @prefecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prefectures/1 or /prefectures/1.json
  def update
    respond_to do |format|
      if @prefecture.update(prefecture_params)
        format.html { redirect_to prefecture_url(@prefecture), notice: "Prefecture was successfully updated." }
        format.json { render :show, status: :ok, location: @prefecture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @prefecture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prefectures/1 or /prefectures/1.json
  def destroy
    @prefecture.destroy

    respond_to do |format|
      format.html { redirect_to prefectures_url, notice: "Prefecture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prefecture
      @prefecture = Prefecture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def prefecture_params
      params.require(:prefecture).permit(:name)
    end
end
