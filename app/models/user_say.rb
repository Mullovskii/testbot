class UserSay < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  belongs_to :bot
  has_many :keys, dependent: :destroy
  has_many :samples, dependent: :destroy

  def make_regexp(input)
  	input.gsub(/@[\wа-я]+/i).with_index { |m, i| "(?<#{m.match(/^@([\wа-я]+)/i).captures[0]}>[\wА-Яа-я1-9]+)" }
  end


end
