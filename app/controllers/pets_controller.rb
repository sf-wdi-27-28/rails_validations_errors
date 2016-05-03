class PetsController < ApplicationController
  before_filter :set_pet, except: [:index,:new,:create]
  before_filter :set_owner

  def index
    @pets = @owner.pets
    # .sort_by do |a,b|
    #   if a.date_of_birth.nil?
    #     a.date_of_birth = DateTime.now
    #   end
    #   if b.nil?
    #     break
    #   elsif b.date_of_birth.nil?
    #     b.date_of_birth = DateTime.now
    #   end
    #   a.date_of_birth <=> b.date_of_birth
    # end
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save
    if @owner.pets << @pet
      flash[:notice] = "New Pet created"
      redirect_to owner_pets_path(@owner)
    else
      flash[:error] = @pet.errors.full_messages.join(", ")
      redirect_to new_owner_pet_path(@owner)
    end
  end

  def show
  end

  def edit
    # stretch
  end

  def update
    # stretch
    if @pet.update(pet_params)
      flash[:notice] = "Pet Edited"
      redirect_to owner_pet_path(@owner,@pet)
    else
      flash[:error] = @pet.errors.full_messages.join(", ")
      redirect_to edit_owner_pet_path(@owner,@pet)
    end
  end

  def destroy
    # stretch
    if @pet.destroy
      flash[:notice] = "Pet Released"
      redirect_to owner_pets_path(@owner,@pet)
    else
      flash[:error] = @owner.errors.full_messages.join(", ")
      redirect_to owner_pet_path(@owner,@pet)
    end
  end


  private
  def pet_params
    params.require(:pet).permit(:name, :breed, :date_of_birth)
  end
  def set_pet
    @pet = Pet.find_by('id': params[:id])
  end
  def set_owner
    @owner = Owner.find_by("id": params[:owner_id])
  end

end
