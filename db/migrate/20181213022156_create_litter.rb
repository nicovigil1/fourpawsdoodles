class CreateLitter < ActiveRecord::Migration[5.1]
  def change
    create_table :litters do |t|
      t.string :name
      t.date :birthday

    end
  end
end
