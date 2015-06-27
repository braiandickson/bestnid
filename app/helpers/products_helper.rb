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

end