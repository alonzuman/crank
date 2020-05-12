require 'faker'

p 'running seed...'

# a = 'https://res.cloudinary.com/dzbpu5woc/video/upload/v1588924445/5_w8xgdm.mp4'


User.create!(email: "bob@bob.bob" , password: '123456', full_name: Faker::Name.name)


10.times do
  user = User.create!(email: Faker::Internet.email, password: '123456', full_name: Faker::Name.name)
  Post.create!(description:"ofek", video: 2, user: user)
end

p 'finished seed...'
