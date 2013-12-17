class Arena
  def initialize(player, opponent)
    @player = player
    @opponent = opponent
    @battle_over = false
    start_fight
  end
  
  def start_fight
    until @battle_over
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

      choose gets.chomp.downcase
    end
  end
	
  def choose(action)
    case action
    when "melee"
      melee_attack
    when "ranged"
      return "You shoot!"
    when "magic"
      return "You flame!"
    when "run"
      flee
    end
  end

  def melee_attack
    return attack( @player.str, 0 )
  end

  def attack(base_stat, item_bonus)
    damage = base_stat + rand(-2..2)
    damage = 0 if damage < 0

    @opponent.hurt(damage)

    if damage == 0
      puts "You miss!"
    else
      puts "You hit the enemy for #{damage} points of damage."
    end
  end

  def flee
    puts "You escape!"
    @battle_over = true
  end

  def get_padded_hp(mobile)
    return "#{mobile.hp}/#{mobile.max_hp}".ljust(10)
  end
end
