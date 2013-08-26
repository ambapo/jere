module ApplicationHelper
	# Defines the title to be returned per page
	def full_title(page_title)
		base_title = "buruQueens"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end
end
