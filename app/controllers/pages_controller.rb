class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def bookings_profile
    @bookings = Booking.where(user: current_user)
  end

  def excursions_profile
    @excursions = Excursion.where(user: current_user)
  end
end
