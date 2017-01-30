class Listing < ApplicationRecord
	mount_uploader :image, ImageUploader
end
