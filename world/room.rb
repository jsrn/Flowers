class Room
	attr_accessor :exits

	def initialize
		@description = get_random_blurb
	end

	def describe
		puts @description

		print "There are exits to the "
		puts exit_long_form
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