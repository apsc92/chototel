# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Creating Territories
%w(London Dubai India Sinagapore USA). each do |name|
  Territory.find_or_create_by(name: name)
end


unless Rails.env.production?
  # Adding Users
  Territory.all.each do |territory|
    4.times do
      u = User.create(name: Faker::Name.name, email: Faker::Internet.email, territory_id: territory.id,
        meeting_target: Faker::Number.number(2), order_target: Faker::Number.number(3), password: 'josh123', role: 'admin')
      u = User.create(name: Faker::Name.name, email: Faker::Internet.email, territory_id: territory.id,
        meeting_target: Faker::Number.number(2), order_target: Faker::Number.number(3), password: 'josh123', role: 'staff')
    end
    4.times do
      u = User.create(name: Faker::Name.name, email: Faker::Internet.email, territory_id: territory.id,
        meeting_target: Faker::Number.number(2), order_target: Faker::Number.number(3), password: 'josh123', role: 'staff')
    end
  end
  User.all.each do |user|
    5.times do
      Contact.create(name: Faker::Name.name, meeting_done: Faker::Number.number(1), order_booked: Faker::Number.number(1),
       user_id: user.id, territory_id: user.territory.id)
    end
  end
end
