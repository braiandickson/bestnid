class Category < ActiveRecord::Base
	has_many :products

	validates :name, presence: true, length: { maximum: 20}
	validates_uniqueness_of :name, {:message => :taken }
	validates :hidden, :inclusion => {:in => [true, false], :message => :invalid }
end
