class Post < ApplicationRecord
  belongs_to :user
  belongs_to :bot
  belongs_to :lesson
end
