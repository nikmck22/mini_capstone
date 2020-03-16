class AddImageUrlsToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :image_1, :string
    add_column :products, :image_2, :string
    add_column :products, :image_3, :string
  end
end
