module UsersHelper

	def has_active_auctions?
		self.products ? self.products.map { |p| p.state.eql? 'active' }.any? : false
	end

end
