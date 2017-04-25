class AddTotalReviewsToListing < ActiveRecord::Migration[5.0]
  def change
    add_column :listings, :total_reviews, :integer, null: false, default: 0
  end
end
