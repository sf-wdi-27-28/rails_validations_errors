class AddPetToOwner < ActiveRecord::Migration
  def change
    add_reference :owners, :owner, index: true, foreign_key: true
  end
end
