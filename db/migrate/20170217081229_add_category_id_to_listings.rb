class AddCategoryIdToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :category_id, :integer
  end
end
