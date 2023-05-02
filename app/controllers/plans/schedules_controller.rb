class Plans::SchedulesController < BaseController
  before_action :set_place, only: [:new, :edit]
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
      # ユーザーが選択した場所を取得
      places = Place.where(id: params[:place_ids])
      # 選択された場所とscheduleテーブルに保存されたidをplace_schedulesテーブルに保存
      places.each do |place|
        @schedule.places << place
      end
      redirect_to plan_path(@plan), notice: '新規作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update(schedule_params)
      redirect_to plan_schedule_path(@plan, @schedule), notice: 'スケジュールを更新しました。'
    else
      render :edit
    end
  end

  def destroy
    if @schedule.destroy
      redirect_to plan_path(@plan), flash: { warning: '削除しました。' }
    else
      redirect_to plan_schedule_path(@plan, @schedule), alert: '削除できませんでした。'
    end
  end

  private

  def set_place
    @places = Place.all
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_schedule
    @schedule = @plan.schedules.find((params[:id]))
  end

  def schedule_params
    params.require(:schedule).permit(:name, :went_on, :memo, place_ids: [],
                                     place_schedules_attributes: [:id, :start_at, :place_id, :_destroy])
  end
end

# indexはいらなくて、new, create, edit, update , deleteかな。
# showはどうするか
# routesも修正する、viewも
