class PetsController < ApplicationController

  def index
    # binding.pry
    owner_id = params[:owner_id]
    @owner = Owner.find_by_id(owner_id)
    @pets = @owner.pets
    render :index
  end

  def new
    @pet = Pet.new
    owner_id = params[:owner_id]
    @owner = Owner.find_by(id: owner_id)
  end

  def create
    owner = Owner.find(params[:owner_id])
    new_pet = Pet.new(pet_params)
    if new_pet.save
      owner.pets << new_pet
      redirect_to owner_pet_path(owner, new_pet)
    else
      flash[:error] = new_pet.errors.full_messages.join(", ")
      redirect_to new_owner_pet_path(owner)
    end
  end

  def show
    # binding.pry
    pet_id = params[:id]
    @pet = Pet.find_by_id(pet_id)
    render :show
  end


  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
