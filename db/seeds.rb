User.destroy_all
Project.destroy_all

owner = User.create!(email: 'owner@codeschool.com')

project = owner.owned_projects.create!(title: 'Developer Career Path')
message = project.messages.create!(title: 'Programming Languages')
message.comments << Comment.create!(body: 'Ruby should be in there')
message.comments << Comment.create!(body: 'JavaScript should be there too!')

project = owner.owned_projects.create!(title: 'How to Cook')
message = project.messages.create!(title: 'Operating a microwave')
message.comments << Comment.create!(body: 'Mastering the numbers is the first step.')
message.comments << Comment.create!(body: 'How long does popcorn take ?')

