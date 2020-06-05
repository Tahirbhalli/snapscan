class User < ApplicationRecord
  has_many :transactins
  has_many :groups
  has_many :particpents
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
