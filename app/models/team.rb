class Team < ApplicationRecord
  validates :name, presence: true

  has_one :user
  has_many :messages
  has_many :programs
end
