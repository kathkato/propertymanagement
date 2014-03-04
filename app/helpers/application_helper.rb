module ApplicationHelper
	def page_title
		@page_title || 'Property Management'
	end

	def footer
		@footer || "Copyright of Katherine Navarrete, 2014"
	end
end
