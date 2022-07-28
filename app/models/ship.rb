class Ship < ApplicationRecord
  has_many :crews
  has_many :occurrences
  has_many :members, through: :crews
  has_one_attached :photo
  validates :name, presence: true
  validates :registration, uniqueness: true, allow_blank: true

  include PgSearch::Model
  pg_search_scope :search_by_ship,
    against: %i[name registration registration_port],
    using: {
      tsearch: { prefix: true }
    }
end
