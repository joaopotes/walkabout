class ExcursionsController < ApplicationController
  before_action :setup_excursion, only: [:show, :edit, :update, :destroy]
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
    @excursion.save
  end

  def edit
  end

  def update
    @excursion = Excursion.update(excursion_params)
  end

  def destroy
    @excursion.destroy
  end

  private

  def excursion_params
    params.require(:excursion).permit(:image, :name, :description, :country, :user_id, :location, :price, :capacity)
  end

  def setup_excursion
    @excursion = Excursion.find(:id)
  end
end
