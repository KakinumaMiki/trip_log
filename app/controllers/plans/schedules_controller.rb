class Plans::SchedulesController < ApplicationController

  def index
    @places = @prefecture.places

  end

  def new
    @plan = Plan.find(params[:plan_id])
    @schedule = @plan.schedules.build
    @place_schedules = @schedule.place_schedules.build
    @places = Place.all
    # @memory = @place.memories.build
    # @schedule =
  end

  def create
    # @memory = @place.memories.build(memory_params)
    #
    # if @memory.save
    #   redirect_to prefecture_place_memory_path(@prefecture, @place, @memory), notice: '新規作成されました。'
    # else
    #   render :new
    # end
  end

  private
  def schedule_params
    # params.require(:memory).permit(:went_on, :with_who, :comment, :star, :price)
    params.require(:schedule).permit(:name, :went_on, :memo)
  end
end

# indexはいらなくて、new, create, edit, update , deleteかな。
# routesも修正する、viewも
