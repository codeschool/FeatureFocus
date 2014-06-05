class Project < ActiveRecord::Base

  belongs_to :owner

  has_many :accesses, dependent: :destroy
  has_many :users, through: :accesses

  has_many :messages, dependent: :destroy
  has_many :comments, through: :messages

  has_many :actions

  scope :recent, -> { order(created_at: :desc) }

end

