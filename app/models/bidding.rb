class Bidding < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :reason, presence: true, length: {:maximum => 250}
  validates :amount, presence: true
  validates_numericality_of :amount, greater_than: 0
end
