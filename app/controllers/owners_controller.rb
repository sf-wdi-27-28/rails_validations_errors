class OwnersController < ApplicationController
  before_filter :set_owner, except: [:index,:new,:create]

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.new(owner_params)
    if owner.save
      flash[:notice] = "New owner created"
      redirect_to owner_path(owner)
    else
      flash[:error] = owner.errors.full_messages.join(", ")
      redirect_to new_owner_path
    end
  end

  def show
  end

  def edit
    # stretch

  end

  def update
    # stretch
    if @owner.update(owner_params)
      flash[:notice] = "New owner Edited"
      redirect_to owner_path(@owner)
    else
      flash[:error] = @owner.errors.full_messages.join(", ")
      redirect_to edit_owner_path
    end
  end

  def destroy
    # stretch
    if @owner.destroy
      flash[:notice] = "New owner Edited"
      redirect_to owners_path
    else
      flash[:error] = @owner.errors.full_messages.join(", ")
      redirect_to owner_path(@owner)
    end
  end


  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end
  def set_owner
    @owner = Owner.find_by("id": params[:id])
  end

end
