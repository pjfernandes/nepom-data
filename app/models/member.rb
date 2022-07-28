class Member < ApplicationRecord
  validates :name, presence: true

  has_many :crews
  has_many :ships, through: :crews
  has_many :occurrences, through: :ships
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :search_by_member,
    against: %i[name CPF doc_number],
    using: {
      tsearch: { prefix: true }
    }
end
