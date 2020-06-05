class Group < ApplicationRecord
  after_create :partircpent
  belongs_to :user
  has_many :particpents
  has_many :groupmembers
  has_one_attached :cover_pic
  private
  def partircpent
    self.particpents.create(user_id: self.user_id)
  end
end
