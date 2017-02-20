class Listing < ApplicationRecord
	
    mount_uploader :image, ImageUploader
    has_many :reviews 
    validates :name, :address, :phone, :email, :website, :image, presence: true
    scope :ordered_listings, -> { order(listings: :asc) }
    has_many :users, through: :review
    belongs_to :category
end
