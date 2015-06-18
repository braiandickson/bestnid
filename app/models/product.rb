class Product < ActiveRecord::Base
	after_initialize :init
	before_save :set_due_date
	belongs_to :user
 
	validates :name, presence: true, uniqueness: true, length: {:maximum => 25}
	validates :description, presence: true, length: {:maximum => 250}
	validates_presence_of :image, :message => :required
	
	include ProductsHelper

	attr_reader :period

	STATES = ['active', 'blocked', 'finished']

	has_attached_file :image, styles: {medium: "300x300>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_inclusion_of :state, :in => STATES, :message => "{{value}} must be in #{STATES.join ','}"

	def set_due_date
		self.due_date ||= due_date_for(self.period)
	end

	def init
		self.state = 'active'
	end

	def self.search(search)
   		where("name like ?", "%#{search}%") 
  end

	def period=(value)
		@period = value.to_i
	end

end