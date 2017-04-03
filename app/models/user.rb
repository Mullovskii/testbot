class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    has_many :bot_actions
    has_many :bots
    has_many :lessons
    has_many :user_says
    has_many :acts
    has_many :entities
end
