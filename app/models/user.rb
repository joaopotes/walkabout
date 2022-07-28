class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :excursions
  has_one_attached :photo
  # validates_associated :bookings       Jenna i dont know if this one is valid
  # validates_associated :excursions     Jenna i dont know if this one is valid

  # validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 5..20 }
  validates :first_name, :last_name, presence: true, length: { minimum: 3 }

  #  validates :role, presence: true, if: :role_guest_host?

  #  def role_guest_host?
  #    :role == "guest" || :role == "host"
  #  end

  #  validates :avatar

end
