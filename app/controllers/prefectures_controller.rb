class PrefecturesController < BaseController
  # GET /prefectures or /prefectures.json
  def index
    @prefectures = Prefecture.all
  end
end
