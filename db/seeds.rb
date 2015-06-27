# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create test user1

admin_user = User.create(
	email: "admin@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "Admin",
	card: "1234123412341235"
)

test_user1 = User.create(
	email: "test@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser1",
	card: "1234123412341234"
)

#Create test user2
test_user2 = User.create(
	email: "test2@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser2",
	card: "1111111111111111"
)