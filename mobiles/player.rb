require_relative "mobile.rb"

class Player < Mobile

	def pick_name
		puts "Greetings, traveller! What is your name?"
		print "> "
		@name = gets.chomp
		puts "Greetings, " + @name
	end

	def print_status
		puts "Name: #{@name}"
		puts "HP: #{@current_hp}/#{max_hp}"
		puts "STR: #{@str} DEX: #{@dex} INT: #{@int}"
	end
end