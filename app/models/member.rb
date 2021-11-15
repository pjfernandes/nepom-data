class Member < ApplicationRecord
  validates :name, presence: true

  has_many :crews
  has_many :ships, through: :crews
  has_many :occurrences, through: :ships
  has_one_attached :photo
end
