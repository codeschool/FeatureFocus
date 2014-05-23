User.destroy_all
Project.destroy_all

owner = User.create!(email: 'owner@codeschool.com')

project = owner.owned_projects.create!(title: 'Developer Career Path')
message = project.messages.create!(title: 'Programming Languages')
message.comments << Comment.create!(body: 'Ruby should be in there')
message.comments << Comment.create!(body: 'JavaScript should be there too!')

