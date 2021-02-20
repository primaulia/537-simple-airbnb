puts "Start of the seed"

puts "clean seed"
Flat.destroy_all


10.times do
  name = Faker::Dessert.variety
  puts "Creating flat #{name}"

  Flat.create!(
    name: name,
    address: Faker::Address.full_address,
    description: Faker::Lorem.paragraph,
    price_per_night: (50..150).to_a.sample,
    number_of_guests: (1..5).to_a.sample
  )
end

puts "done seeding!"