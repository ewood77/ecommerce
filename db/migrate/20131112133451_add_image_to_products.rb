class AddImageToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_path, :string
  end
end
