class Inquiry < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :question, presence: true, length: {:maximum => 250}
  validates :answer, length: {:maximum => 250}
end
