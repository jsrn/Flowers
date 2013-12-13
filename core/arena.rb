class Arena
  def initialize(player, opponent)
    @player = player
    @opponent = opponent
    start_fight
  end
  
  def start_fight
    result = ""
    while 1
      puts "\e[H\e[2J"

      puts " #{@player.profile_picture[0]}#{" " * 30}#{@opponent.profile_picture[0]}"
      puts " #{@player.profile_picture[1]}#{" " * 30}#{@opponent.profile_picture[1]}"
      puts " #{@player.profile_picture[2]}#{" " * 30}#{@opponent.profile_picture[2]}"
      puts " #{@player.profile_picture[3]}#{" " * 30}#{@opponent.profile_picture[3]}"
      puts " #{@player.profile_picture[4]}#{" " * 30}#{@opponent.profile_picture[4]}"
      puts " #{@player.profile_picture[5]}#{" " * 30}#{@opponent.profile_picture[5]}"
      puts " #{@player.profile_picture[6]}#{" " * 30}#{@opponent.profile_picture[6]}"
      puts " #{@player.profile_picture[7]}#{" " * 30}#{@opponent.profile_picture[7]}\n"
      puts "           ------------------------------"
			
      print " #{get_padded_hp(@player)}"
      print " " * 30
      puts "#{get_padded_hp(@opponent)}\n"

      puts "\n#{result}\n" if result != ""
      puts "\nOptions:"
      puts " - melee     - ranged     - magic     - run"

      print "ACTION> "

      action = gets.chomp.downcase

      result = choose(action)

      puts result

      break if win_condition?(result)
    end
  end
	
  def choose(action)
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
	
  def win_condition?(result)
    return true if result == "You win!"
    return true if result == "You escape!"
  end

  def get_padded_hp(mobile)
    return "#{mobile.hp}/#{mobile.max_hp}".ljust(10)
  end
end
