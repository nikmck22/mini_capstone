class RemoveImageUrlColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :image_1, :string
    remove_column :products, :image_2, :string
    remove_column :products, :image_3, :string
  end
end
