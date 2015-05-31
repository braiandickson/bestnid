class Product < ActiveRecord::Base
	after_initialize :init
	belongs_to :user

	STATES = ['active', 'blocked', 'finished']

	has_attached_file :image, styles: {medium: "300x300>"}
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_inclusion_of :state, :in => STATES, :message => "{{value}} must be in #{STATES.join ','}"

	def due_date_for(validity_period)
		validity_period.days.from_now
	end

	def init
		self.state = 'active'
	end

end