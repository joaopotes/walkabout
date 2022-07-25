class Excursion < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  validates :country, :location, presence: true
  validates :price, numericality: { only_float: true }
  validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 500 }

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :description, :country, :location, :price, :capacity ],
    using: {
      tsearch: { prefix: true }
    }
end
