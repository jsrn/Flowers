require_relative "mobile.rb"

class Orc < Mobile
	def initialize
		@name = "an orc"
		@description = "A horrible orc!"
		@str, @dex, @int = 10, 5, 1
		super
	end
end