class Event < ApplicationRecord
  belongs_to :bot
  belongs_to :lesson
end
