# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create test user1
User.create(
	email: "test@test.com",
	encrypted_password: "$2a$10$ryA06tbRXsFlssnQAL4ka.iZxiowcbFkSeSBNH8YezWwsdY/X3.tq",
	name: "TestUser1",
	card: "1234123412341234"
)

#Create test user2
User.create(
	email: "test2@test.com",
	encrypted_password: "$2a$10$uOBJNpirhlkyBJZbRNHMnOGJmN0mmnCYIQcb87lzYNqHYf2rpvOXO",
	name: "TestUser2",
	card: "1111111111111111"
)