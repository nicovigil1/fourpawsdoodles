class CreateParentLitters < ActiveRecord::Migration[5.1]
  def change
    create_table :parent_litters do |t|
      t.belongs_to :litter, foreign_key: true
      t.belongs_to :parent, foreign_key: true
    end
  end
end
