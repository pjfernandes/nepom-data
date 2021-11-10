class Ship < ApplicationRecord
  has_many :crews
  has_many :occurrences
  has_one_attached :photo
  validates :name, presence: true
  validates :registration, uniqueness: true, allow_blank: true
end
