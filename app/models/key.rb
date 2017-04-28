class Key < ApplicationRecord
  belongs_to :user_say, optional: true
  belongs_to :bot
  belongs_to :lesson, optional: true
  has_many :samples
  has_many :attachements, as: :attachable

  before_save { self.name = self.name.to_s.split(' ').join('_').mb_chars.downcase.to_s }

end
