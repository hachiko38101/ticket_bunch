class Team < ApplicationRecord
  validates :name, presence: true

  has_many :users, through: :user_teams  
  has_many :user_teams
  has_many :messages
end
