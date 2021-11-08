class Crew < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :ship, optional: true
end
