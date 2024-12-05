json.id post.id
json.type "posts"
json.attributes do
  json.extract! post, :title
  json.extract! post, :content
end
json.relationships do
  json.author do
    json.data do
      json.type "user"
      json.id post.user_id
    end
  end
end

# json.extract! post, :id, :title, :content, :user_id, :created_at, :updated_at
# json.url post_url(post, format: :json)
