module ProductsHelper

	def due_date_for(validity_period)
		validity_period.days.from_now
	end

	def criteria_for(field)
		criteria = {
			"name" => "Nombre",
			"due_date" => "Fecha de Finalización",
			"created_at" => "Fecha de Publicación"
		}
		criteria[field]
	end

	def is_cancellable?
		current_user == @product.user && @product.biddings.size == 0
	end

	def winner
		winning_bidding = self.biddings.find {|b| b.is_winner?}
		winning_bidding ? winning_bidding.user : nil
	end

	def has_winner?
		!self.winner.nil?
	end
	
	def has_biddings?
		!self.biddings.empty?
	end

	def refresh_state
		if self.state = 'active'
			self.state = 'finished' if Time.today.date > self.due_date
		end
	end

end