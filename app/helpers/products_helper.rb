module ProductsHelper

	def due_date_for(validity_period)
		validity_period.days.from_now
	end

end
