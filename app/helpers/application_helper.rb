module ApplicationHelper

	#turn text to markdown
	def md(text)
		if text.present?
			RDiscount.new(text).to_html.html_safe

		else
			""
		end
	end
end
