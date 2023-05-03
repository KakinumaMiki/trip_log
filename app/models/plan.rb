class Plan < ApplicationRecord
  belongs_to :user
  has_many :schedules

  scope :opened, ->() { where(status: true) }
  scope :closed, ->() { where(status: false) }

  scope :user_plans, ->(user) { joins(:user).where(user: user) }
  scope :other_plans, ->(user) { opened.joins(:user).where.not(user: user) }

  def date
    if end_date.blank? || start_date == end_date
      start_date
    else
      if start_date.strftime('%y') == end_date.strftime('%y')
        "#{start_date} ~ #{end_date.strftime('%m-%d')}"
      else
        "#{start_date} ~ #{end_date}"
      end
    end
  end
end
