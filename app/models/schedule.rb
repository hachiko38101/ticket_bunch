class Schedule < ApplicationRecord
  validates :date, presence: true
  validates :start_time, presence: true

  belongs_to :program
  validates_presence_of :program

end
