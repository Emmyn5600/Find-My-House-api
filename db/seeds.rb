User.create(
    name: 'emmyn5600',
    email: 'emmy66418@gmail.com',
    password: 'password',
    password_confirmation:'password',
    is_admin: true
)

4.times do
    House.create({
        name: Faker::Name.first_name,
        description: Faker::Lorem.sentence,
        price: Faker::Lorem.sentence,
        image: Faker::Lorem.sentence,
        user_id: user.id
    })
end