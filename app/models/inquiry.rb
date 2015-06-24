class Inquiry < ActiveRecord::Base
  belongs_to :product

  validates :question, presence: true, length: {:maximum => 250}
  validates :answer, length: {:maximum => 250}
end
