# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create! email: 'user1@example.com', password: '11111111'
user2 = User.create! email: 'user2@example.com', password: '11111111'
agent = User.create! email: 'agent@example.com', password: '11111111', role: :agent
admin = User.create! email: 'admin@example.com', password: '11111111', role: :admin

[user1, user2].each do |user|
  rand(5..10).times do 
    created = Time.zone.now - rand(20..50).days
    Ticket.create!(user: user, title: [Faker::Hacker.abbreviation,  Faker::Hacker.adjective, Faker::Hacker.noun].shuffle.join(' ') , body: Faker::Hacker.say_something_smart, created_at: created, updated_at: created)
  end

  Ticket.where( user: user ).first(4).each do |ticket|
    ticket.update( closed: (ticket.created_at + rand(0..10).days) )
  end
end

