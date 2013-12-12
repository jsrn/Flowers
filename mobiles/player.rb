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
    puts "| Inventory:"
  end

  def grant_xp(xp)
    @xp += xp
    puts "You earned #{xp} xp!"
    check_level_up
  end

  def check_level_up
    if @xp >=  110 + ( @level * 10 )
      level_up
    end
  end


  def level_up
  end   
end