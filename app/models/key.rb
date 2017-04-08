class Key < ApplicationRecord
  belongs_to :user_say
  belongs_to :bot
  belongs_to :lesson
  has_many :samples
end
