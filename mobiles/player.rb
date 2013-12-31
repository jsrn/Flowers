require_relative "mobile.rb"

class Player < Mobile

  def initialize
    super
    @name = "Douglas"
    @description = "The intrepid hero."
    @str, @dex, @int = 1, 1, 1
    @profile_picture = [
      "   @@     ",
      "  .@@. |D ",
      "  @@@@ |  ",
      "  @@@ @   ",
      "  .@@.    ",
      "  @  @    ",
      "  @  @    ",
      " ==  ==   "
    ]
    @hp = max_hp
    @xp = 0
  end

  def print_status
    describe
    puts "| XP: " << @xp.to_s << "/" << xp_for_leveling_up.to_s
    puts "| Inventory:"
  end

  def grant_xp(xp)
    @xp += xp
    puts "You earned #{xp} xp!"
    check_level_up
  end

  def check_level_up
    if @level < 50 && @xp >= xp_for_leveling_up
      level_up
    end
  end

  def level_up
    @xp -= xp_for_leveling_up
    @level += 1
    chosen = false
    until chosen
      puts "Pick a stat to increase: strength / dexterity / intelligence"
      print "> "
      case gets.chomp.downcase
      when "strength"
        @str += 1
        chosen = true
      when "dexterity"
        @dex += 1
        chosen = true
      when "intelligence"
        @int += 1
        chosen = true
      end
    end
  end

  def xp_for_leveling_up
    110 + ( @level * 10 )
  end

  def die
    puts "You have died."
    puts "At the time of your death, you were level #{@level} and had #{@xp} experience."
    exit
  end
end
  