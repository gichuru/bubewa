class AddAvgRatingToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :avg_rating, :decimal, null: false, default: 0.00
  end
end
