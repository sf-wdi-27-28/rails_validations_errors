class OwnersController < ApplicationController

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def create
    owner = Owner.create(owner_params)

    if owner.save
      flash[:notice] = "yay!"
      redirect_to owner_path(owner)
    else
      flash[:error] = owner.errors.full_messages.join(", ")
      redirect_to new_owner_path
    end
  end

  def show
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)
  end

  def edit
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)

    render :edit
  end

  def update
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)

    @owner.update_attributes(owner_params)

    if @owner.save
      redirect_to owner_path(owner_id)
    else
      flash[:error] = @owner.errors.full_messages.join(", ")
      redirect_to edit_owner_path(owner_id)
    end
  end

  def destroy
    owner_id = params[:id]
    @owner = Owner.find_by(id: owner_id)

    @owner.destroy

    redirect_to owners_path
  end


  private
  def owner_params
    params.require(:owner).permit(:first_name, :last_name, :email, :phone)
  end

end
