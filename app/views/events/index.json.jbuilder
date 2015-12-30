json.array!(@events) do |event|
  json.extract! event, :id, :description, :event_name, :date, :place
  json.url event_url(event, format: :json)
end
