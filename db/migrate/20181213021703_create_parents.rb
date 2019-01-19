class CreateParents < ActiveRecord::Migration[5.1]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :breed
      t.string :registration
      t.string :genetics
      t.string :role
    end
  end
end
