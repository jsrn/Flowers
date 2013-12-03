$:.unshift(Dir.pwd)

class Flowers

     require "core/player.rb"

     def initialize
          print_banner
          set_up_game
          enter_game_loop
     end

     def print_banner
          puts ".----------------------------- FLOWERS -----------------------------."
          puts "|                   A(n) ORG_NAME_HERE Adventure                    |"
          puts "|          dot|not           ToxicVenom             jsrn            |"
          puts "`-------------------------------------------------------------------'"
     end

     def handle_input(input)
          puts input
     end

     def enter_game_loop
          while 1 do
               print "> "
               input = gets.chomp
               handle_input(input)
          end
     end

     def set_up_game
          @player = Player.new
          @player.pick_name
     end
end

# Create a new object from the class "Flowers" and store it in the variable
# "game"
game = Flowers.new