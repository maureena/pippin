require 'faker'

# Create Users
5.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save
end
users = User.all


# Create Venues
20.times do
  Venue.create(
    name: Faker::Lorem.words(3).join(" "),
    body: Faker::Lorem.paragraph(2),
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.cell_phone,
    website: Faker::Internet.url
  )
end
venues = Venue.all

# Create Categories
10.times do
  Category.create(
    name: Faker::Lorem.words(2).join(" ")
  )
end
categories = Category.all


# Create Events
50.times do
  e = Event.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(2),
    price: Faker::Commerce.price)
    e.venues<<venues.sample
    e.categories<<categories.sample
end
events = Event.all


User.first.update_attributes(
  email: 'maureen.adamo@gmail.com',
  password: 'helloworld',
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Event.count} events created"
puts "#{Venue.count} venues created"