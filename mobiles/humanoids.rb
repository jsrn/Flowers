require_relative "mobile.rb"

class Orc < Mobile
	def initialize
		super
		@name = "an orc"
		@description = "A horrible orc!"
	end
end