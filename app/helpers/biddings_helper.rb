module BiddingsHelper
	
	def is_winner?
		self.is_winner
	end

	def amount_money
		self.print_float(self.amount)
	end

	private

	def print_float(value)
  sprintf('%05.2f', value)
	end

end
