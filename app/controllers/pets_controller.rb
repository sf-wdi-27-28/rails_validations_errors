class PetsController < ApplicationController

  def index
    # binding.pry
    owner_id = params[:owner_id]
    # pet_id = params[:id]
    @owner = Owner.find_by_id(owner_id)
    # @pet = Pet.find_by_id(pet_id)
    @pets = @owner.pets
  end

  def new
    @pet = Pet.new
    owner_id = params[:owner_id]
    @owner = Owner.find_by(id: owner_id)
  end

  def create
    owner = Owner.find(params[:owner_id])
    pet = Pet.new(pet_params)

    if pet.save
      owner.pets << pet
      redirect_to owner_pet_path(owner, pet)
    else
      redirect_to new_owner_pet_path(owner)
    end
  end

  def show
    pet_id = params[:id]
    @pet = Pet.find_by_id(pet_id)
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
