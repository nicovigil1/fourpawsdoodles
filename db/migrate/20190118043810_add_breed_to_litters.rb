class AddBreedToLitters < ActiveRecord::Migration[5.1]
  def change
    add_column :litters, :breed, :string
  end
end
