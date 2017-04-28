class Attachement < ApplicationRecord
  belongs_to :bot_action
  belongs_to :bot
  belongs_to :attachable, polymorphic: true
end
