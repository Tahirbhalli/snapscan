class Group < ApplicationRecord
  after_create :partircpent
  belongs_to :user
  has_many :particpents
  has_many :groupmembers
  has_one_attached :cover_pic

  private

  def partircpent
    particpents.create(user_id: user_id)
  end
end
