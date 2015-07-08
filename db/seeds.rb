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

#Create test user3
test_user3 = User.create(
	email: "test3@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser3",
	card: "2222222222222222"
)
#Create test user4
test_user4 = User.create(
	email: "test4@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser4",
	card: "4444444444444444"
)
#Create test user5
test_user5 = User.create(
	email: "test5@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser5",
	card: "5555555555555555"
)
#Create test user6
test_user6 = User.create(
	email: "test6@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser6",
	card: "6666666666666666"
)
#Create test user7
test_user7 = User.create(
	email: "test7@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser7",
	card: "7777777777777777"
)
#Create test user8
test_user8 = User.create(
	email: "test8@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser8",
	card: "8888888888888888"
)
#Create test user9
test_user9 = User.create(
	email: "test9@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser9",
	card: "9999999999999999"
)
#Create test user10
test_user10 = User.create(
	email: "test10@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser10",
	card: "1010101010101010"
)
#Create test user11
test_user11 = User.create(
	email: "test11@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser11",
	card: "1111000011110000"
)
#Create test user12
test_user12 = User.create(
	email: "test12@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser12",
	card: "1212121212121212"
)
#Create test user13
test_user13 = User.create(
	email: "test13@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser13",
	card: "1313131313131313"
)
#Create test user14
test_user14 = User.create(
	email: "test14@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser14",
	card: "1414141414141414"
)
#Create test user15
test_user15 = User.create(
	email: "test15@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser15",
	card: "1515151515151515"
)
#Create test user16
test_user16 = User.create(
	email: "test16@test.com",
	password: "test1234",
	password_confirmation: "test1234",
	name: "TestUser16",
	card: "1616161616161616"
)