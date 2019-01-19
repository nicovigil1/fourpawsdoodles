class CreatePuppers < ActiveRecord::Migration[5.1]
  def change
    create_table :puppers do |t|
      t.string :gender
      t.string :breed
      # t.string :image_path
      # t.string :name
      t.boolean :sold, default: false
      t.belongs_to :litter
    end
  end
end
