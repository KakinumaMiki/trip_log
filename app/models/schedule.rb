class Schedule < ApplicationRecord
  belongs_to :plan
  has_many :place_schedules
  has_many :places, through: :place_schedules

  accepts_nested_attributes_for :place_schedules

  def ordered_places
    places.order(:start_at)
  end

  def place_schedule(place)
    place_schedules.find_by(place: place)
  end

  def start_at(place)
    place_schedule(place).start_at
  end
end
