class BookingsController < ApplicationController
before_action :set_booking, only: [:edit, :update, :destroy]
before action :set_excursion, only: :create
  def new
    @booking = Booking.new
  end

  def create
    #  @excursion = Excursion.find(params[:excursion_id])   Added in before_action
    @booking = Booking.new(booking_params)
    @booking.excursion = @excursion
    if @booking.save
      redirect_to excursion_bookings_path(@excursion)
    else
      render :new
    end
  end

  def edit

  end

  def update
  end

  def destroy
    #  @booking = Booking.find(params[:id])       Added in before_action
    @booking.destroy
    redirect_to excursion_bookings_path(@booking.excursion)
  end

  private

  def booking_params
    params.require(:booking).permite(:start_time, :end_time, :user_id, :excursion_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_excursion
    @excursion = Excursion.find(params[:excursion_id])
  end
end
