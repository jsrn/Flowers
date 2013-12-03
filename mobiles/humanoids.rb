require_relative "mobile.rb"

class Orc < Mobile
	def initialize
		super
		@name = "Orc"
		@description = "A horrible orc!"
	end
end