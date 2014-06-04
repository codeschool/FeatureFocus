User.destroy_all
Project.destroy_all
Action.destroy_all

owner = User.create!(email: 'owner@codeschool.com')

project = owner.owned_projects.create!(title: 'Developer Career Path')

(1..10).each do |i|
  member = User.find_or_create_by!(email: "member-#{i}@codeschool.com")
  project.users << member
end

message = project.messages.create!(title: 'Programming Languages')

member1 = User.find_by!(email: "member-1@codeschool.com")
message.comments << Comment.new(body: 'Ruby should be in there',  user: member1)

member2 = User.find_by!(email: "member-2@codeschool.com")
message.comments << Comment.new(body: 'JavaScript should be there too!',  user: member2)

message.save!


member3 = User.find_by!(email: "member-3@codeschool.com")
project.todos.create!(title: 'Learn Ruby',  user: member3)

member4 = User.find_by!(email: "member-4@codeschool.com")
project.todos.create!(title: 'Learn Rails',  user: member4)

project = owner.owned_projects.create!(title: 'How to Cook')

(5..15).each do |i|
  member = User.find_or_create_by!(email: "member-#{i}@codeschool.com")
  project.users << member
end

message = project.messages.create!(title: 'Operating a microwave')


member10 = User.find_by!(email: "member-10@codeschool.com")
message.comments << Comment.new(body: 'Popcorn is pretty easy to make',  user: member10)

member12 = User.find_by!(email: "member-12@codeschool.com")
message.comments << Comment.new(body: 'Instant Rice FTW',  user: member12)

message.save!
