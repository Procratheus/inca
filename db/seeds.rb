require "faker"

# Delete all records upon each seed 
User.delete_all

# Create standard users
30.times do 
  standard_user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20),
    confirmed_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
    last_sign_in_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
    invitation_limit: 0,
    roles: false
    )
  standard_user.skip_confirmation!
  standard_user.save!
end

# Create admin users
5.times do 
  admin_user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password(10, 20),
    confirmed_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
    last_sign_in_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
    invitation_limit: nil,
    roles: true
    )
  admin_user.skip_confirmation!
  admin_user.save!
end

1.times do 
  super_user = User.new(
    name: "Admin User",
    email: "admin@example.com",
    password: "adminuser",
    confirmed_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
    last_sign_in_at: Faker::Time.between(DateTime.now - 2, DateTime.now),
    invitation_limit: nil,
    roles: true
    )
  super_user.skip_confirmation!
  super_user.save!
end

users = User.all
admin_users = User.where(roles: true)
standard_users = User.where(roles: false)


# Print out seeded data
puts "#{users.count} users seeded in development"
puts "#{admin_users.count} admin users seeded in development"
puts "#{standard_users.count} seeded users in development"



