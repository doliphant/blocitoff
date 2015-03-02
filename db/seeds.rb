require 'faker'

tester = User.new(
  email: 'test_user@example.com',
  password: 'pewfortest'
)
tester.skip_confirmation!
tester.save!


list = List.new(
  user: tester,
  title: Faker::Lorem.sentence
)
list.save!

10.times do
  item = Item.create!(
    list: list,
    name: Faker::Lorem.sentence
  )

  item.update_attributes!(created_at: rand(10.minutes .. 7.days).ago)

end


puts "Seed finished"
puts "#{User.count} users created."
puts "#{List.count} lists created."
puts "#{Item.count} items created."
