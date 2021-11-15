class Occurrence < ApplicationRecord
  belongs_to :user
  belongs_to :ship
  include PgSearch::Model
  pg_search_scope :search_by_ship,
    associated_against: {
      ship: %i[name registration registration_port]
    },
    using: {
      tsearch: { prefix: true }
    }

  #reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode

end
