class Project < ActiveRecord::Base

  belongs_to :owner

  has_many :accesses
  has_many :users, through: :accesses
  has_many :actions, through: :users

  has_many :messages, dependent: :destroy
  has_many :todos, dependent: :destroy

  scope :recent, -> { order(created_at: :desc) }

end

