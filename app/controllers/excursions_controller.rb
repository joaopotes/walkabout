class ExcursionsController < ApplicationController
  before_action :set_excursion, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @excursions = Excursion.search(params[:query])
    else
      @excursions = Excursion.all

      @markers = @excursions.geocoded.map do |excursion|
        {
          lat: excursion.latitude,
          lng: excursion.longitude,
          info_window: render_to_string(partial: "info_window", locals: { excursion: excursion }),
          image_url: helpers.asset_url("green_marker.png")
        }
      end
    end
  end

  def show
  end

  def new
    @excursion = Excursion.new
  end

  def create
    @excursion = Excursion.new(excursion_params)
    @excursion.user = current_user
    if @excursion.save
      redirect_to myexcursions_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @excursion = Excursion.update(excursion_params)
    redirect_to myexcursions_path
  end

  def destroy
    @excursion.destroy
    redirect_to myexcursions_path
  end

  private

  def excursion_params
    params.require(:excursion).permit(:image, :name, :description, :country, :location, :price, :capacity)
  end

  def set_excursion
    @excursion = Excursion.find(params[:id])
  end
end
