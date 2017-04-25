namespace :reviews do
  desc "Updates Averge Reviews for Listing"
  task update_average: :environment do
      listings = Listing.all
      listings.each do |listing|
          reviews = Review.where(listing_id: listing.id)

          avg_rating = reviews.average(:rating).round(2)
          listing.update_attributes(
            avg_rating: avg_rating, total_reviews: reviews.length)
      end
  end
end
