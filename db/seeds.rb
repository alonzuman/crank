require 'faker'

p 'running seed...'

10.times do 
  User.create!(email: Faker::Internet.email, password: '123456')
end

p 'finished seed...'