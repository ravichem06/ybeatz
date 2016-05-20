json.array!(@communities) do |community|
  json.extract! community, :id, :name, :title, :content
  json.url community_url(community, format: :json)
end
