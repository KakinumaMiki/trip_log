class Place < ApplicationRecord
  belongs_to :prefecture
  belongs_to :category
  has_many :memories
  has_many :place_schedules
  has_many :schedules, through: :place_schedules

  validates :name, presence: true
end
