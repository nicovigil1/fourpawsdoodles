class RemoveBreedFromPuppers < ActiveRecord::Migration[5.1]
  def change
    remove_column :puppers, :breed, :string
  end
end
