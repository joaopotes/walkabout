class Excursion < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  # validates :name, presence: true, uniqueness: true
  # validates :description, presence: true, length: { maximum: 1000, too_long: "%{count} characters is the maximum allowed" }
  # validates :country, :location, presence: true
  # validates :price, numericality: { only_float: true }
  # validates :capacity, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 500 }

  include PgSearch::Model
  pg_search_scope :search,
    against: [ :name, :description, :price, :address ],
    using: {
      tsearch: { prefix: true }
    }
end
