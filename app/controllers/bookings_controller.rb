class BookingsController < ApplicationController
before_action :set_booking, only: [:edit, :update, :destroy]
before_action :set_excursion, only: [:new, :create]

  def new
    @booking = Booking.new
  end

  def create
    #  @excursion = Excursion.find(params[:excursion_id])   Added in before_action
    @booking = Booking.new(booking_params)
    @booking.excursion = @excursion
    @booking.user = current_user
    if @booking.save
      redirect_to mybookings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking = Booking.update(booking_params)
    redirect_to myprofile_path
  end

  def destroy
    #  @booking = Booking.find(params[:id])       Added in before_action
    @booking.destroy
    redirect_to myprofile_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_excursion
    @excursion = Excursion.find(params[:excursion_id])
  end
end
