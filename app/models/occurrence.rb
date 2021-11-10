class Occurrence < ApplicationRecord
  belongs_to :user
  belongs_to :ship

  reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode

end
