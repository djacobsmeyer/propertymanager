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

tenantuser = Tenant.new(
    name:     'Tenant User',
    email:    'tenant@example.com',
    password: 'helloworld',
    property_id: 1,
)
tenantuser.save!

  5.times do
    property = Property.create(
      user:       users.sample,
      company:       Faker::Company.name,
      address:    Faker::Address.street_address,
      city:       Faker::Address.city,
      state:      Faker::Address.state,
      zipcode:    Faker::Address.zip_code,
      totalsqft:  10000 || 5000 || 60000,
      mortgage:   1600,
      billingaddress:    Faker::Address.street_address,
      billingcity:       Faker::Address.city,
      billingstate:      Faker::Address.state,
      billingzipcode:    Faker::Address.zip_code,
    )
  end
  properties = Property.all

  30.times do
    tenant = Tenant.create(
      email:      Faker::Internet.email,
      password:   Faker::Internet.password,
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
  tenants = Tenant.all

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

  100.times do
    receivable = Receivable.create(
      property:   properties.sample,
      payer:      tenants.sample.name,
      amount:     Faker::Number.decimal(2),
      date:       Faker::Date.backward(50),
      duedate:    Faker::Date.forward(100)
    )
  end

  receivables = Receivable.all

  150.times do
    line_item = LineItem.create(
      receivable: receivables.sample,
      itemname:   "Lease Payment" || "Utilities",
      description: "description text",
      value:      Faker::Number.decimal(3)
    )
  end

  75.times do
    request = Request.create(
      tenant:     tenants.sample,
      title:      Faker::Lorem.sentence,
      description: Faker::Lorem.sentences,
      completed:   false
    )
  end
