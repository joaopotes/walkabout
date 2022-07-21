class ExcursionsController < ApplicationController
  before_action :set_excursion, only: %i[show edit update destroy]
  def index
    @excursions = Excursion.all
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
