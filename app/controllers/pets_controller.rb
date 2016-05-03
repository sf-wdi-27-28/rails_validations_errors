class PetsController < ApplicationController

  def index
     @owners = Owner.all
  #  @pets = Pet.all
  # owner_id = params[:owner_id]
  # @owner = Owner.find_by_id(owner_id)
  # @pets = @owner.pets
  #render :index
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
