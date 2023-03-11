class Prefectures::Places::MemoriesController < ApplicationController
  before_action :set_prefecture
  before_action :set_place
  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @memory = @place.memories.build
  end

  def edit
  end

  def create
    @memory = @place.memories.build(memory_params)

    if @memory.save
      redirect_to prefecture_place_memory_path(@prefecture, @place, @memory), notice: '新規作成されました。'
    else
      render :new
    end
  end

  def update
    if @memory.update(memory_params)
      redirect_to prefecture_place_memory_path(@prefecture, @place, @memory), notice: '更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @memory.destroy
      redirect_to prefecture_place_path(@prefecture, @place), flash: { warning: '記録を削除しました。' }
    else
      redirect_to prefecture_place_path(@prefecture, @place), alert: '削除できませんでした。'
    end
  end

  private

  def set_prefecture
    @prefecture = Prefecture.find(params[:prefecture_id])
  end

  def set_place
    @place = @prefecture.places.find(params[:place_id])
  end

  def set_memory
    @memory = @place.memories.find(params[:id])
  end

  def memory_params
    params.require(:memory).permit(:went_on, :with_who, :comment, :star, :price)
  end
end
