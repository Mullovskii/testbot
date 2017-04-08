class Sample < ApplicationRecord
  belongs_to :user_say
  belongs_to :bot
  belongs_to :key
end
