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
    @schedule = Schedule.find(params[:id])

    # パラメータからplace_schedules_attributesを取得
    place_schedules_attributes = params[:schedule][:place_schedules_attributes]

    # 削除対象のキーを格納する配列
    keys_to_delete = []

    place_schedules_attributes.each do |key, attributes|
      # この if の塊は、消したいplace_idを入れている
      if params[:schedule][:place_ids]
        existing_place_ids = params[:schedule][:place_ids].map(&:to_i)
        deleted_place_ids = @schedule.place_ids - existing_place_ids
      else
        deleted_place_ids = @schedule.place_ids
      end
      deleted_place_ids = deleted_place_ids.map(&:to_s)

      deleted_place_ids.each do |deleted_place_id|
        # 消したいplace_id と、取得しているattributeのplace_idが一致したらそのkeyを取得しておく
        if attributes["place_id"] == deleted_place_id
          keys_to_delete << key
        end
      end
    end

    # 削除対象のキーをもとにパラメーターからデータを削除
    keys_to_delete.each do |key|
      place_schedules_attributes.delete(key)
    end
    # schedule_params メソッドを呼び出して、更新に使用するパラメーターを取得
    updated_params = schedule_params

    if @schedule.update(updated_params)
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
