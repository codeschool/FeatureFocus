# Basecamp Demo

This app aims to replicate some of the features from Basecamp.

```ruby
class User
  has_many :user_projects
  has_many :projects, through: :user_projects

  has_many :owned_projects, foreign_key: 'owner_id', class_name: 'Project'
end

class Project

  belongs_to :owner

  has_many :messages # kind of like forum threads.
  has_many :todos
  has_many :forwards
  has_many :attachments, as: :attachable
end

class Message
  has_many :comments, as: :commentable
  has_many :uploads, as: :attachable
end

class Todo
  has_many :comments, as: :commentable
  has_many :attachments, though: :comments
end

class Forward
  has_many :comments, as: :commentable
  has_many :attachments, though: :comments
end

class Comment
  belongs_to :commentable, polymorphic: true
end

class Attachment
  belongs_to :attachable, polymorphic: true
end
```
