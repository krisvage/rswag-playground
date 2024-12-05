json.links do |links|
  links.self "https://example.com/posts"
end
json.data @posts.each do |post|
  json.partial! "post", post:
end
