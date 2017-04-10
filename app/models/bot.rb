class Bot < ApplicationRecord
  belongs_to :user
  has_many :lessons
  has_many :acts
  has_many :user_says
  has_many :bot_actions
  has_many :posts
  has_many :schedules
  has_many :events
  has_many :entities

  has_many :keys
  has_many :samples
  has_many :checks
end
