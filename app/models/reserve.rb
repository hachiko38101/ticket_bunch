class Reserve < ApplicationRecord
  validates :number, presence: true

  belongs_to :customer
  belongs_to :program
end
