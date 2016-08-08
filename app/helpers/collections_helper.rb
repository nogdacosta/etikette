module CollectionsHelper

	def uri_parse string
		Addressable::URI.heuristic_parse(string).to_s
	end

end
