class Crew < ApplicationRecord
  belongs_to :member, optional: true
  belongs_to :ship, optional: true
  include PgSearch::Model
  pg_search_scope :search_by_ship,
    associated_against: {
      ship: %i[name registration registration_port]
    },
    using: {
      tsearch: { prefix: true }
    }
end
