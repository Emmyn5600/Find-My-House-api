4.times do
    House.create({
        name: Faker::Name.first_name,
        description: Faker::Lorem.sentence,
        price: Faker::Lorem.sentence,
        image: Faker::Lorem.sentence
    })
end