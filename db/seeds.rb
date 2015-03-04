require 'faker'

tester = User.new(
  email: 'test_user@example.com',
  password: 'pewfortest'
)
tester.save!


list = List.new(
  user: tester,
  title: Faker::Lorem.word
)
list.save!

10.times do
  item = Item.create!(
    list: list,
    name: Faker::Lorem.sentence(3)
  )

  item.update_attributes!(created_at: rand(10.minutes .. 7.days).ago)

end

danger_item = Item.first
danger_item.update_attributes!(
  created_at: 7.days.ago
)

warning_item = Item.second
warning_item.update_attributes!(
  created_at: 5.days.ago
)


puts "Seed finished"
puts "#{User.count} users created."
puts "#{List.count} lists created."
puts "#{Item.count} items created."
