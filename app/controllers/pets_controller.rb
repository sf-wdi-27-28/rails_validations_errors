class PetsController < ApplicationController

  def index
    @owner = Owner.find_by_id(params[:id])
  end

  def new
  end

  def create
  end

  def show
    @pet = Pet.find_by_id(params[:id])
    @owner = Owner.find_by_id(params[:id])
  end


  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
