class Plans::SchedulesController < BaseController
  before_action :set_places, only: [:new, :edit]
  before_action :set_plan
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @schedule = @plan.schedules.build
  end

  def create
    @schedule = @plan.schedules.build(schedule_params)
    if @schedule.save
      redirect_to plan_path(@plan), notice: '新規作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    # エラーにはなるけど削除する
    if params[:schedule][:place_ids]
      existing_place_ids = params[:schedule][:place_ids].map(&:to_i)
      deleted_place_ids = @schedule.place_ids - existing_place_ids
      @schedule.place_schedules.where(place_id: deleted_place_ids).destroy_all
    end

    if @schedule.update(schedule_params)
      redirect_to plan_schedule_path(@plan, @schedule), notice: 'スケジュールを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    @schedule.place_schedules.destroy_all
    if @schedule.destroy
      redirect_to plan_path(@plan), flash: { warning: '削除しました。' }
    else
      redirect_to plan_schedule_path(@plan, @schedule), alert: '削除できませんでした。'
    end
  end

  private

  def set_places
    @places = Place.user_places(current_user).all
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_schedule
    @schedule = @plan.schedules.find((params[:id]))
  end

  def schedule_params
    # ここのplace_schedules_attributesで:idとか色々使っているから、削除することができない。。
    params.require(:schedule).permit(:name, :went_on, :memo, place_ids: [],
                                     place_schedules_attributes: [:id, :start_at, :place_id, :_destroy])
  end
end

# indexはいらなくて、new, create, edit, update , deleteかな。
# showはどうするか
# routesも修正する、viewも
