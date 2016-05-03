class AddFkToPets < ActiveRecord::Migration
  def change
    change_table :pets do |t|
      t.belongs_to :owner
    end
  end
end
