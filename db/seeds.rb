require 'faker'

# Create Posts
50.times do 
  Post.create!(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
    )
end

Post.find_or_create_by!(
  title: "This title is unique",
  body: "This body is unique"
  )


posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

Comment.find_or_create_by!(
  body: "This comment is unique"
  )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"