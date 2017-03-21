class Lesson < ApplicationRecord
  belongs_to :bot
  belongs_to :user
  has_many :user_says
  has_many :acts
end
