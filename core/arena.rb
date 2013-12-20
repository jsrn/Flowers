class Arena
  @@won_fight = false

  def initialize(player, opponent)
    @player = player
    @opponent = opponent
    @battle_over = false
    @last_message = ""
    @last_response = ""
    start_fight
  end
  
  def start_fight
    @@won_fight = false

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

      puts "\n#{@last_message}\n" if @last_message != ""
      puts "\n#{@last_response}\n" if @last_response != ""
      puts "\nOptions:"
      puts " - melee     - ranged     - magic     - run"

      print "ACTION> "

      choose gets.chomp.downcase
      process_opponent_turn
    end
  end

  def choose(action)
    case action
    when "melee"
      melee_attack
    when "ranged"
      @last_message = "You shoot!"
    when "magic"
      @last_message = "You flame!"
    when "run"
      flee
    end
  end

  def melee_attack
    attack( @player.str, 0 )
  end

  def attack(base_stat, item_bonus)
    damage = base_stat + rand(3..7)
    damage = 0 if damage < 0

    @opponent.hurt(damage)

    if @opponent.hp <= 0
      win
    end

    if damage == 0
      @last_message = "You miss!"
    else
      @last_message = "You hit the enemy for #{damage} points of damage."
    end
  end

  def enemy_attack(base_stat)
    damage = base_stat + rand(3..7)
    damage = 0 if damage < 0

    @player.hurt(damage)

    if @player.hp <= 0
      lose
    end

    if damage == 0
      @last_response = "They miss!"
    else
      @last_response = "They hit you for #{damage} points of damage."
    end
  end

  def flee
    @last_message = "You escape!"
    @battle_over = true
  end

  def process_opponent_turn
    stat_total = @opponent.str + @opponent.dex + @opponent.int
    choice = rand(1..stat_total)

    if choice <= @opponent.str
      enemy_attack( @opponent.str )
    elsif choice <= @opponent.str + @opponent.dex
      enemy_attack( @opponent.dex )
    else
      enemy_attack( @opponent.int )
    end
  end

  def win
    @battle_over = true
    @@won_fight = true
    puts "You win!"
    puts "You earn however much xp!"
    puts "You find whatever items!"
  end

  def lose
    @battle_over = true
    @@won_fight = false
  end

  def Arena.won_fight?
    @@won_fight
  end

  def get_padded_hp(mobile)
    return "#{mobile.hp}/#{mobile.max_hp}".ljust(10)
  end
end
