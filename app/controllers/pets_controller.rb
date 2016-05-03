class PetsController < ApplicationController

  def index
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
  end

  def show
    pet_id = params[:id]

    @pet = Pet.find_by(id: pet_id)

    owner_id = params[:owner_id]

    @owner = Owner.find_by(id: owner_id)
  end


  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end

end
