class Ship < ApplicationRecord
  has_many :crews
  has_many :occurrences
end
