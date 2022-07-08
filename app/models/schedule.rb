class Schedule < ApplicationRecord
  validates :date, presence: true
  validates :start_time, presence: true

  belongs_to :program, inverse_of: :schedules
  validates_presence_of :program

  def date_time
    self.savedate.to_s.slice(5,2)+ "月" + self.savedate.to_s.slice(8, 2) + "日/" + self.savetime.to_s + "~"
  end

end
