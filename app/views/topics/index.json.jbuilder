json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :description, :member_id
  json.url topic_url(topic, format: :json)
end
