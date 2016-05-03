class PetsController < ApplicationController

  def index
    o_id = params[:owner_id]
    @owner = Owner.find_by_id(o_id)
    @pets = @owner.pets
  end

  def new
    o_id = params[:owner_id]
    @owner = Owner.find_by_id(o_id)
    @pets = Pet.new
    render :new
  end

  def create
    o_id = params[:owner_id]
    owner = Owner.find_by_id(o_id)
    pet = Pet.new(pet_params)
    if pet.save
      owner.pets << pet
      redirect_to owner_pet_path(owner, pet)
    else
      flash[:error] = pet.error.full_messages.join(", ")
      redirect_to new_owner_pet_path(owner)
    end
  end

  def show
  end


  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
