class Memory < ApplicationRecord
  belongs_to :place

  validates :went_on, :star, presence: true
end
