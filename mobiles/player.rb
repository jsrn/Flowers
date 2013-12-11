require_relative "mobile.rb"

class Player < Mobile

	def initialize
		super
		@name = "Douglas"
		@description = "The intrepid hero."
		@str, @dex, @int = 1, 1, 1
		@profile_picture = [
			"   @@     ",
			"  .@@. |D ",
			"  @@@@ |  ",
			"  @@@ @   ",
			"  .@@.    ",
			"  @  @    ",
			"  @  @    ",
			" ==  ==   "
		]
		@hp = max_hp
	end

	def print_status
		describe
		puts "| Inventory:"
	end
end