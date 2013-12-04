class Arena

	def Arena.fight(player,opponent)
		while 1
			puts ".--------------------------------------------------------.\n"\
				 "|   player                                    enemy      |\n"\
				 "|--------------------------------------------------------|\n"\
				 "| menu stuff                                             |"
			print "ACTION> "
			action = gets.chomp
			puts "You are #{action}ing"

			break if action == "win"
		end
	end
end