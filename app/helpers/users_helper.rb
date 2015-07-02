module UsersHelper

	def has_active_auctions?
		self.products.map { |p| p.state.eql? 'active' }.any?
	end

	def any_auctions_waiting_for_winner?
		self.products.map { |p| p.has_biddings? && p.winner.nil? }.any?
	end

end
