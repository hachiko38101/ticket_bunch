class Program < ApplicationRecord
  validates :name, presence: true

  belongs_to :team
  has_many :schedules, inverse_of: :program, dependent: :destroy
  has_many :reserves, dependent: :destroy
  accepts_nested_attributes_for :schedules, allow_destroy: true
end