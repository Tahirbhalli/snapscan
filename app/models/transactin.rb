class Transactin < ApplicationRecord
    belongs_to :user
    has_many :groupmembers
end
