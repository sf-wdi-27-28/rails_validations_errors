class PetsController < ApplicationController

  def index
    owner_id = params[:owner_id]
    @owner = Owner.find_by id: owner_id

  end

  def new
    owner_id = params[:owner_id]
    @owner = Owner.find_by id: owner_id
    @pet = Pet.new
  end

  def create
    owner_id = params[:owner_id]
    @owner = Owner.find_by id: owner_id
    @pet = Pet.create(pet_params)
    if @pet.save(@pet)
      render :create
    else
      redirect_to new_owner_pet_path
      flash[:error] = pet.errors.full_messages.join(", ")
    end
  end

  def show
    pet_id = params[:id]
    @pet = Pet.find_by id: pet_id
  end


  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
