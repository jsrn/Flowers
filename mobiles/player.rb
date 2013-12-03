require_relative "mobile.rb"

class Player < Mobile

	def pick_name
		puts "Greetings, traveller! What is your name?"
		@name = gets.chomp
		puts "Greetings, " + @name
	end
end