class Room
	attr_accessor :exits
	attr_accessor :monsters

	def initialize
		@description = get_random_blurb
		@monsters = generate_monsters
	end

	def describe
		puts @description
		puts "There are exits to the #{exit_long_form}."
		puts "Lurking in the area you see #{monsters_long_form}."
	end

	def generate_monsters
		monsters = []
		monsters << Orc.new
		monsters << Orc.new
		monsters << Drow.new
	end

	def monsters_long_form
		names = @monsters.collect { |x| x.name }
		names.join(", ")
	end

	def exit_long_form
		exits = @exits.split("|")
		exits[-1] = "and " << exits[-1] if exits.length > 1
		exits.join(", ")
	end

	def get_random_blurb
		[
			"You look around and find yourself in a room.\n",
			"There are trees and stuff.\n"
		].sample
	end

	def has_exit?(direction)
		@exits.split("|").include?(direction)
	end
end