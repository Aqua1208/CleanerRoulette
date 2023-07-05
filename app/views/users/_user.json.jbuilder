json.extract! user, :id, :name, :attend, :created_at, :updated_at
json.url user_url(user, format: :json)
