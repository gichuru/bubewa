class Listing < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reviews
    has_many :users, through: :reviews
    validates :name, :address, :phone, :email, :website, :image, presence: true
    #Listing.order("created_at DESC")
end
