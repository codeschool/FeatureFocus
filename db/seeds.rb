require 'faker'

User.destroy_all
Project.destroy_all


require 'active_support/testing/time_helpers'
include ActiveSupport::Testing::TimeHelpers


developer_career = nil
how_to_cook = nil

name = -> { [Faker::Name.first_name, Faker::Name.last_name].join(' ') }


travel_to(3.days.ago) do

  owner = User.create!(name: 'Project Owner', email: 'owner@codeschool.com')

  ############
  # Project 1
  ############
  developer_career = owner.owned_projects.create!(title: 'Developer Career Path')

  (1..10).each do |i|
    member = User.find_or_create_by!(email: "member-#{i}@codeschool.com").tap do |u|
      u.name = name.call
      u.save!
    end
    developer_career.users << member
  end

  message = developer_career.messages.create!(body: 'Programming Languages', user: User.last)

  member1 = User.find_by!(email: "member-1@codeschool.com")
  message.comments << Comment.new(body: 'Ruby should be in there', user: member1)

  member2 = User.find_by!(email: "member-2@codeschool.com")
  message.comments << Comment.new(body: 'JavaScript should be there too!', user: member2)

  message.save!

  sleep 1



  ############
  # Project 2
  ############
  how_to_cook = owner.owned_projects.create!(title: 'How to Cook')

  (5..15).each do |i|
    member = User.find_or_create_by!(email: "member-#{i}@codeschool.com").tap do |u|
      u.name = name.call
      u.save!
    end

    how_to_cook.users << member
  end

  message = how_to_cook.messages.create!(body: 'Operating a microwave', user: User.last)


  member10 = User.find_by!(email: "member-10@codeschool.com")
  message.comments << Comment.new(body: 'Popcorn is pretty easy to make',  user: member10)

  member12 = User.find_by!(email: "member-12@codeschool.com")
  message.comments << Comment.new(body: 'Instant Rice FTW',  user: member12)

  message.save!

  ############
  # Project 3
  ############
  personal_finance = owner.owned_projects.create!(title: 'Personal Finance')

  (10..20).each do |i|
    member = User.find_or_create_by!(email: "member-#{i}@codeschool.com").tap do |u|
      u.name = name.call
      u.save!
    end

    personal_finance.users << member
  end

  personal_finance.users << User.find_by(email: "member-5@codeschool.com")


  message = personal_finance.messages.create!(body: 'Rent or Purchase ?', user: User.last)
  message.comments << Comment.new(body: 'Definitely Rent',  user: member1)
  message.comments << Comment.new(body: 'Really it depends.',  user: member2)

  message.save!

  ############
  # Project 4 - current user does not have access to this project.
  ############
  world_cup = owner.owned_projects.create!(title: 'World Cup 2014')

  (15..25).each do |i|
    member = User.find_or_create_by!(email: "member-#{i}@codeschool.com").tap do |u|
      u.name = name.call
      u.save!
    end

    world_cup.users << member
  end

  message = world_cup.messages.create!(body: 'Team Rankings Website', user: User.last)
  message.comments << Comment.new(body: 'This should be live updated using JavaScript.',  user: User.last)
end



travel_to(2.day.ago) do
  message = developer_career.messages.create!(body: 'Anyone using Swift yet ?', user: User.last)

  member1 = User.find_by!(email: "member-1@codeschool.com")
  message.comments << Comment.new(body: 'I have not. But I want to try it out.',  user: member1)

  member2 = User.find_by!(email: "member-2@codeschool.com")
  message.comments << Comment.new(body: 'Heard good things about it.',  user: member2)

  message.save!
end



travel_to(1.day.ago) do
  message = how_to_cook.messages.create!(body: 'Hot Pockets hard to make ?', user: User.last)

  member1 = User.find_by!(email: "member-1@codeschool.com")
  message.comments << Comment.new(body: 'As long as you do not overheat them...',  user: member1)
  message.comments << Comment.new(body: 'As long as you do not overheat them...',  user: member1)
  message.comments << Comment.new(body: 'As long as you do not overheat them...',  user: member1)
  message.comments << Comment.new(body: 'As long as you do not overheat them...',  user: member1)
  message.comments << Comment.new(body: 'As long as you do not overheat them...',  user: member1)
  message.comments << Comment.new(body: 'As long as you do not overheat them...',  user: member1)

  member2 = User.find_by!(email: "member-2@codeschool.com")
  message.comments << Comment.new(body: 'They are easy!',  user: member2)
  message.comments << Comment.new(body: 'They are easy!',  user: member2)
  message.comments << Comment.new(body: 'They are easy!',  user: member2)
  message.comments << Comment.new(body: 'They are easy!',  user: member2)
  message.comments << Comment.new(body: 'They are easy!',  user: member2)
  message.comments << Comment.new(body: 'They are easy!',  user: member2)

  message.save!
end
