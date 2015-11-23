json.array!(@games) do |game|
  json.extract! game, :id, :name, :owner
  json.url game_url(game, format: :json)
end
