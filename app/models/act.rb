class Act < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  belongs_to :bot
end
