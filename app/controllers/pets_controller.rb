class PetsController < ApplicationController

  def index
    # binding.pry
    owner_id = params[:owner_id]
    pet_id = params[:id]
    @owner = Owner.find_by_id(owner_id)
    @pet = Pet.find_by_id(pet_id)
    @pets = @owner.pets
  end

  def new
  end

  def create
  end

  def show
  end


  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
