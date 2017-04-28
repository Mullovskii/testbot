class Check < ApplicationRecord
  belongs_to :bot
  belongs_to :lesson
  has_many :attachements, as: :attachable
end
