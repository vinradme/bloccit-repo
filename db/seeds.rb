require 'faker'

# Create Posts
50.times do 
  Advertisement.create!(
    title: Faker::Lorem.sentence,
    copy: Faker::Lorem.paragraph,
    price: "16"
    )
end
advertisements = Advertisement.all

# Create Comments
#100.times do
#  Comment.create!(
#    post: posts.sample,
#    body: Faker::Lorem.paragraph
#    )
#end

puts "Seed finished"
#puts "#{Post.count} posts created"
puts "#{Advertisement.count} advertisements created"

#puts "#{Comment.count} comments created"