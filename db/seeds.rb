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
users = User.all

  5.times do
    property = Property.create(
      user:       users.sample,
      address:    Faker::Address.street_address,
      city:       Faker::Address.city,
      state:      Faker::Address.state,
      zipcode:    Faker::Address.zip_code,
      totalsqft:  10000,
      mortgage:   1600
    )
  end
  properties = Property.all

  30.times do
    tenant = Tenant.create(
      property:   properties.sample,
      name:       Faker::Company.name,
      address:    Faker::Address.street_address,
      city:       Faker::Address.city,
      state:      Faker::Address.state,
      zipcode:    Faker::Address.zip_code,
      leasestart: Faker::Date.backward(500),
      leaseend:   Faker::Date.forward(1000)
    )
  end

  40.times do
    payable = Payable.create(
      property:   properties.sample,
      vendor:     Faker::Company.name,
      amount:     Faker::Number.decimal(2),
      date:       Faker::Date.backward(50),
      duedate:    Faker::Date.forward(100)
    )
  end
  payables = Payable.all

  35.times do
    receivable = Receivable.create(
      property:   properties.sample,
      payer:      Faker::Company.name,
      amount:     Faker::Number.decimal(2),
      date:       Faker::Date.backward(50),
      duedate:    Faker::Date.forward(100)
    )
  end
