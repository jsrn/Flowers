$:.unshift(Dir.pwd)

class Flowers

     Dir["core/*.rb"].each {|file| require file }
     Dir["mobiles/*.rb"].each {|file| require file }
     Dir["world/*.rb"].each {|file| require file }

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
          @world = World.new
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
          when "look"
               @world.describe_current_room
          when "compass"
               puts @world.get_coords
          else
               parse_input(input)
          end
     end

     def parse_input(input)
          if input.start_with?("go ")
               @world.try_movement(input[3..-1])
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
