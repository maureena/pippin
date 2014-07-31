require 'faker'


# Create Events

50.times do
  Event.create(
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph(2),
    price: Faker::Commerce.price
  )
end
events = Event.all

# Create Venues

10.times do
  Venue.create(
    name: Faker::Lorem.words(3).join(" "),
    body: Faker::Lorem.paragraph(2),
    address: Faker::Address.street_address,
    phone: Faker::PhoneNumber.cell_phone,
    website: Faker::Internet.url
  )
end
venues = Venue.all

# Associate a few random events and venues
20.times do
  events.sample.venues<<venues.sample
  venues.sample.events<<events.sample
end

puts "Seed finished"
puts "#{Event.count} events created"
puts "#{Venue.count} venues created"