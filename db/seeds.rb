# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

user = User.new(
    name:     'Member User',
    email:    'user@example.com',
    password: 'helloworld'
  )
user.skip_confirmation!
user.save!

  5.times do
    property = Property.create(
      user:       user.sample
      address:    Faker::Address.street_address
      city:       Faker::Address.city
      state:      Faker::Address.state
      zipcode:    Faker::Address.zipcode
      totalsqft:  10000
      mortgage:   1600
    )
  end

  8.times do
    tenant = Tenant.create(
      property:   property.sample
      name:       Faker::Company.name
      address:    Faker::Address.street_address
      city:       Faker::Address.city
      state:      Faker::Address.state
      zipcode:    Faker::Address.zipcode
      leasestart: Faker::Date.backward(500)
      leaseend:   Faker::Date.forward(1000)
    )
  end
