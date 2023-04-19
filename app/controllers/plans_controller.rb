class PlansController < ApplicationController
  before_action :set_plan, only: %i[ show edit update destroy ]

  # GET /plans or /plans.json
  def index
    @plans = Plan.all
  end

  # GET /plans/1 or /plans/1.json
  def show
  end

  # GET /plans/new
  def new
    @places = Place.order(:prefecture_id, :id)
    @plan = Plan.new
  end

  # GET /plans/1/edit
  def edit
  end

  # POST /plans or /plans.json
  def create
    return redirect_to new_plan_path, alert: '日時を確認してください' if plan_params[:start_date] > plan_params[:end_date]
    @plan = Plan.new(plan_params)

    if @plan.save
      redirect_to plan_url(@plan), notice: 'プランが作成されました。'
    else
      render :new
    end
  end

  # PATCH/PUT /plans/1 or /plans/1.json
  def update
    return redirect_to edit_plan_path(@plan), alert: '日時を確認してください' if plan_params[:start_date] > plan_params[:end_date]
    if @plan.update(plan_params)
      redirect_to plan_url(@plan), notice: '更新されました。'
    else
      render :edit
    end
  end

  # DELETE /plans/1 or /plans/1.json
  def destroy
    if @plan.destroy
      redirect_to plans_url, flash: { warning: 'プランを削除しました。' }
    else
      redirect_to prefecture_place_path(@prefecture, @place), alert: '削除できませんでした。'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_plan
    @plan = Plan.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def plan_params
    params.require(:plan).permit(:name, :start_date, :end_date, :with_who, :memo)

  end
end
