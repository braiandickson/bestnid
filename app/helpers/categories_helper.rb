module CategoriesHelper

	def is_selectable?
		!self.hidden?
	end

end