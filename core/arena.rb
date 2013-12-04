class Arena
	def Arena.fight(player,opponent)
		result = ""
		while 1
			puts "\e[H\e[2J"

			puts " @@@@@@@@@@                              @@@@@@@@@@"
			puts " @@@@@@@@@@                              @@@@@@@@@@"
			puts " @@@@@@@@@@                              @@@@@@@@@@"
			puts " @@@@@@@@@@                              @@@@@@@@@@"
			puts " @@@@@@@@@@                              @@@@@@@@@@"
			puts " @@@@@@@@@@                              @@@@@@@@@@"
			puts " @@@@@@@@@@                              @@@@@@@@@@"
			puts " @@@@@@@@@@                              @@@@@@@@@@\n"
			puts "           ------------------------------"
			
			print " #{Arena.get_padded_hp(player)}"
			print " " * 30
			puts "#{Arena.get_padded_hp(opponent)}\n"

			puts "#{result}\n\n" if result != ""
			puts "Options:"
			puts " - melee     - ranged     - magic     - run"

			print "ACTION> "

			action = gets.chomp.downcase

			result = Arena.choose(action)

			puts result

			break if Arena.win_condition?(result)
		end
	end

	def Arena.win_condition?(result)
		return true if result == "You win!"
		return true if result == "You escape!"
	end

	def Arena.choose(action)
		case action
		when "melee"
			return "You swing!"
		when "ranged"
			return "You shoot!"
		when "magic"
			return "You flame!"
		when "run"
			return "You escape!"
		end
	end

	def Arena.get_padded_hp(mobile)
		return "#{mobile.hp}/#{mobile.max_hp}".ljust(10)
	end
end