$:.unshift(Dir.pwd)

class Flowers

     Dir["core/*.rb"].each {|file| require file }
     Dir["mobiles/*.rb"].each {|file| require file }

     def initialize
          print_banner
          set_up_game
          enter_game_loop
     end

     def print_banner
          puts ".----------------------------- FLOWERS -----------------------------.\n"\
               "|                   A Stained Glass Games Adventure                 |\n"\
               "|          dot|not           ToxicVenom             jsrn            |\n"\
               "`-------------------------------------------------------------------'"
     end

     def set_up_game
          @player = Player.new
          @player.pick_name
     end

     def enter_game_loop
          while 1 do
               print "> "
               input = gets.chomp
               handle_input(input)
          end
     end

     def handle_input(input)
          case input
          when "quit"
               exit_prompt
          when "status"
               @player.print_status
          when "inventory"
               Inventory.view(@player)
          else
               orc = Orc.new
               orc.describe
               Arena.fight(@player,orc)
          end
     end

     def exit_prompt
          puts "Are you sure you want to exit?"
          print "[y/n]: "
          exit_game if gets.chomp.downcase == "y"
     end

     def exit_game
          puts "Thank you for playing Flowers!\n"\
               " - Stained Glass Games\n"\
               "   dot|not\n"\
               "   ToxicVenom\n"\
               "   jsrn"
          exit
     end
end

game = Flowers.new
