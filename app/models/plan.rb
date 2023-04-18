class Plan < ApplicationRecord
  has_many :schedules

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
