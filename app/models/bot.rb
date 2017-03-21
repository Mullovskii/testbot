class Bot < ApplicationRecord
  belongs_to :user
  has_many :lessons
  has_many :acts
  has_many :user_says

end
