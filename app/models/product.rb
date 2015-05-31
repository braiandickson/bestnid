class Product < ActiveRecord::Base
	after_initialize :init
	before_save :set_due_date
	belongs_to :user

	include ProductsHelper

	attr_reader :period

	STATES = ['active', 'blocked', 'finished']

	has_attached_file :image, styles: {medium: "300x300>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_inclusion_of :state, :in => STATES, :message => "{{value}} must be in #{STATES.join ','}"

	def set_due_date
		self.due_date = due_date_for(self.period)
	end

	def init
		self.state = 'active'
	end

	def period=(value)
		@period = value.to_i
	end

end