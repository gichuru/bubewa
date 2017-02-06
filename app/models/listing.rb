class Listing < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :reviews
    validates :name, :address, :phone, :email, :website, :image, presence: true
end
