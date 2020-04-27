# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'down/http'
require 'faker'
require 'openssl'

# 1.upto(1000) do
#   fakey = Faker::Name.unique.first_name

#   User.create(email: fakey + "@example.com", username: fakey, password: "badpassword" )
# end

1.upto(1000) do
  tempfile = Down.download(Faker::LoremFlickr.image(size: "400x400"))
  post = Post.new
  post.description = Faker::Books::Dune.saying
  post.user_id = rand(1...1000)
  post.image.attach(io: File.open(tempfile), filename: 'image.jpg')
  post.save
end

# first three users like every single post (superfans? bots?)
1.upto(3) do |u|
  1.upto(1000) do |p|
    Like.create(user_id: u, post_id: p)
  end
end

# next ten users are influencers, but only if they have posts
4.upto(14) do |u|
  user = User.find(u)
  user.posts.each do |post|
    rand(1000...2000).times do
      Like.create(user_id: rand(4...1000), post_id: post.id)
    end
  end
end

# first 200 posts have few likes
1.upto(200) do |p|
  rand(0...3).times do
    Like.create(user_id: rand(4...1000), post_id: p)
  end
end

# next 725 posts have medium likes
201.upto(925) do |p|
  rand(10...100).times do
    Like.create(user_id: rand(4...1000), post_id: p)
  end
end

# final 75 posts are very popular
926.upto(1000) do |p|
  rand(300...997).times do
    Like.create(user_id: rand(4...1000), post_id: p)
  end
end
