module CollectionsHelper

	def uri_parse string
		uri = URI::parse(string)
		if uri.scheme.nil? && uri.host.nil?
		  unless uri.path.nil?
		    uri.scheme = "http"
		    uri.host = uri.path
		    uri.path = ""
		  end
		end
		uri.to_s
	end
	
end
