require_relative "mobile.rb"

class Orc < Mobile
	def initialize
		@name = "an orc"
		@description = "A horrible orc!"
		@str, @dex, @int = 10, 5, 1
		super
	end
end

class Drow < Mobile
	def initialize
		@name = "a drow"
		@description = "A dark elf, fast, cunning and cruel."
		@str, @dex, @int = 3, 5, 5
		super
	end
end