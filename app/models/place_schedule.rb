class PlaceSchedule < ApplicationRecord
  belongs_to :place
  belongs_to :schedule
end
