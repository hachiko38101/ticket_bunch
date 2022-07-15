class Customer < ApplicationRecord
  validates :name, presence: true
  validates :name_kana, presence: true

  has_many :teams
end
