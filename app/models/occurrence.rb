class Occurrence < ApplicationRecord
  belongs_to :user
  belongs_to :ship
  include PgSearch::Model
  pg_search_scope :search_by_origin_and_destination,
    against: %i[ship_origin ship_destination],
    using: {
      tsearch: { prefix: true }
    }
  pg_search_scope :search_by_ship,
    associated_against: {
      ship: %i[name registration registration_port]
    },
    using: {
      tsearch: { prefix: true }
    }
end
