class Group < ApplicationRecord
  belongs_to :user
  has_many :particpents

  has_one_attached :cover_pic
end
