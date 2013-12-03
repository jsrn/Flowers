$:.unshift(Dir.pwd)

class Flowers

     require "mobiles/player.rb"

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
          @player.print_status
     end
end

game = Flowers.new