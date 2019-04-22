class AddImageToParents < ActiveRecord::Migration[5.1]
  def change
    add_column :parents, :image, :string, :default => "http://2r.co.za/wp-content/uploads/2016/08/no-image-yet.png"
  end
end
