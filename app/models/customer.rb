class Customer < ApplicationRecord
  validates :name, presence: true
  validates :name_kana, presence: true

  belongs_to :team
end
