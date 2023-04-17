class Plan < ApplicationRecord
  has_many :schedules

  def date
    if end_date.blank? || start_date == end_date
      start_date
    else
      "#{start_date} ~ #{end_date}"
    end
  end
end
