module ApplicationHelper
    def page_title(page_title)
		base_title = "Kenyan ratings and reviews community, products, services, public servants and institutions"

		if page_title.empty?
			base_title
		else
			"#{page_title}"
		end
	end
end
