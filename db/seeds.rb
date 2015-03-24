require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end
posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

Post.find_or_create_by(title: "A nice try") do |post|
  post.title = "A nice try"
  post.body = "I'm adding in a body tag"
  end

Post.find_or_create_by(title: "A nice try again") do |post|
  post.title = "A nice try again",
  post.body = "I'm adding in another body tag"
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"