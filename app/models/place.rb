class Place < ApplicationRecord
  belongs_to :prefecture
  belongs_to :category
  belongs_to :user
  has_many :memories
  has_many :place_schedules
  has_many :schedules, through: :place_schedules

  validates :name, presence: true

  scope :opened, ->() { where(status: true) }
  scope :closed, ->() { where(status: false) }

  scope :user_places, ->(user) { joins(:user).where(user: user) }
  scope :other_places, ->(user) { opened.joins(:user).where.not(user: user) }

  def open?
    status
  end
end
