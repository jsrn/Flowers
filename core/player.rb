class Player

	def get_name
		return @name
	end

	def pick_name
		puts "Greetings, traveller! What is your name?"
		@name = gets.chomp
		puts "Greetings, " + @name
	end
end