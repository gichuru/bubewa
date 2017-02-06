class AddTitleToListings < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :title, :string
  end
end
