class Team < ApplicationRecord
  validates :name, presence: true

  has_many :user_teams
end
