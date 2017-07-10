require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'admin@example.com', nickname: 'Admin', name: 'First Admin', password: 'admin123')
Agent.create!(email: 'agent@example.com', nickname: 'Agent', name: 'First Agent', password: 'agent123')
customer = Customer.create!(email: 'customer@example.com', nickname: 'Customer', name: 'First Customer', password: 'customer123')

5.times do
  Ticket.create!(title: Faker::Lorem.sentence, description: Faker::Lorem.paragraph, user_id: customer.id, status: Ticket::PENDING)
end
