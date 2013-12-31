require_relative "mobile.rb"

class Spider < Mobile
  def initialize
    super
    @name = "a spider"
    @description = "A spider hunting for flesh."
    @str, @dex, @int = 3, 5, 3
    @profile_picture = [
      '          ',
      '  ______  ',
      ' /oo oo \ ',
      ' \ vvv  / ',
      '  \----/  ',
      '  /||||\  ',
      '          ',
      '          '
    ]
    @hp = max_hp
  end
end