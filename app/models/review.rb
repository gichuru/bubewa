class Review < ApplicationRecord
	belongs_to :user
	acts_as_votable
	belongs_to :listing
	validates :rating, :comment, presence: true
  	validates :rating, numericality: {
	    only_integer: true,
	    greater_than_or_equal_to: 1,
	    less_than_or_equal_to: 5,
	    message: "You have to select at least 1 star if not more stars.."
	    }
	
end
