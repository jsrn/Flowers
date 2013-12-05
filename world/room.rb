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
		exit_names = {
			:n => "north",
			:e => "east",
			:s => "south",
			:w => "west"
		}

		exit_letters = @exits.split("")

		exit_letters.map! do |letter|
			exit_names[letter.to_sym]
		end

		if exit_letters.length > 1
			exit_letters[-1] = "and " << exit_letters[-1]
		end

		exit_letters.join(", ")
	end

	def get_random_blurb
		[
			"You look around and find yourself in a room.\n",
			"There are trees and stuff.\n"
		].sample
	end
end