class Listing < ApplicationRecord
	include PgSearch
    mount_uploader :image, ImageUploader

    has_many :reviews
    has_many :users, through: :review
    belongs_to :category

    validates :name, :address, :phone, :email, :website, :image, presence: true

    scope :ordered_listings, -> { order(listings: :asc) }
    scope :trending, -> { where("avg_rating > 3.5") }
    scope :worst, -> { where("avg_rating < 2.0") }
    scope :latest, -> { order("created_at DESC") }
    

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
