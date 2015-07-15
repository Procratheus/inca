require "faker"

# Delete all records upon each seed 
User.delete_all

# Create standard users
30.times do 
  standard_user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20),
    roles: false
    )
  standard_user.save
end

# Create admin users
5.times do 
  admin_user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20),
    roles: true
    )
  admin_user.save
end

users = User.all
admin_users = User.where(roles: true)
standard_users = User.where(roles: false)


# Print out seeded data
puts "#{users.count} seeded in development"
puts "#{admin_users} seeded in development"
puts "#{standard_users} seeded in development"



