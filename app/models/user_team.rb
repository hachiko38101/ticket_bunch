class UserTeam < ApplicationRecord
  validates :level, presence: true

  belongs_to :user
  belongs_to :team
end
