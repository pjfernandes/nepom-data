class Member < ApplicationRecord
  validates :name, presence: true
  
  has_many :crews
  has_many :occurrences
  has_one_attached :photo
end
