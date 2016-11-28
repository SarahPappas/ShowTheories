class ApplicationController < ActionController::API
	before_filter :set_access

	def set_access
	  response.headers["Access-Control-Allow-Origin"] = "http://localhost:8000"
	end
end
