require_relative "mobile.rb"

class Player < Mobile

	def initialize
		@name = "player"
		@description = "The intrepid hero."
		@str, @dex, @int = 1, 1, 1
		super
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
	end

	def pick_name
		puts "Greetings, traveller! What is your name?"
		print "Enter name: "
		@name = gets.chomp
		puts "Greetings, " + @name
	end

	def print_status
		describe
		puts "| Inventory:"
	end
end