class Room
	def initialize
		@description = get_random_blurb
	end

	def describe
		puts @description
	end

	def get_random_blurb
		[
			"You look around and find yourself in a room.\n",
			"There are trees and stuff.\n"
		].sample
	end
end