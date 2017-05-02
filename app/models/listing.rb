class Listing < ApplicationRecord
	include PgSearch

    mount_uploader :image, ImageUploader
    has_many :reviews
    validates :name, :address, :phone, :email, :website, :image, presence: true
    scope :ordered_listings, -> { order(listings: :asc) }
    has_many :users, through: :review
    belongs_to :category

	# Search scope
    pg_search_scope :search,
		against: [:name, :description, :address, :title],
		associated_against: { :category => [:name] },
		using: { tsearch: { dictionary: "english" } }

	def self.text_search(query)
		if query.present?
			search(query)
		else
			all
		end
    end
end
