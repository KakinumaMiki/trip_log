class Memory < ApplicationRecord
  belongs_to :place

  validates :went_on, :star, presence: true

  scope :ave_by_stars, -> { average(:star) }

  scope :avg_stars, -> { average(:star).round(1) }
  scope :avg_stars_percentage, -> { average(:star).round(1).to_f * 100 / 5 }
end
