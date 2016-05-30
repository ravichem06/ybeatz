json.array!(@posts) do |post|
  json.extract! post, :id, :subject, :body, :topic_id, :member_id
  json.url post_url(post, format: :json)
end
