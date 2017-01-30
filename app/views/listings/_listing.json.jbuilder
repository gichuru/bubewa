json.extract! listing, :id, :name, :description, :address, :phone, :email, :website, :created_at, :updated_at
json.url listing_url(listing, format: :json)