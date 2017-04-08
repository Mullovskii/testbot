class Lesson < ApplicationRecord
  belongs_to :bot
  belongs_to :user
  has_many :user_says
  has_many :acts
  has_many :posts
  has_many :schedules
  has_many :events

  has_many :keys
end
