json.extract! request, :id, :name, :website, :reason, :created_at, :updated_at
json.url request_url(request, format: :json)