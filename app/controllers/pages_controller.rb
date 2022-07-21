class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  
  def home
  end

  # Methods for the Profile Page

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
