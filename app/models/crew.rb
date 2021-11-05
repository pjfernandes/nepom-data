class Crew < ApplicationRecord
  belongs_to :member
  belongs_to :ship
end
