json.array!(@users) do |user|
  json.extract! user, :email, :name
  json.url user_url(user, format: :json)
end