require_relative "room.rb"

class World
	def initialize
		@x, @y = 0, 0
		@rooms = {}
		@current_room = Room.new
		@current_room.exits = "north|east|south|west"
		store_room( @current_room, @x, @y)
	end

	def describe_current_room
		@current_room.describe
	end

	def store_room( room, x, y )
		@rooms[x] = {} if @rooms[x].nil?
		@rooms[x][y] = room
	end

	def try_movement(direction)
		if @current_room.has_exit?(direction)
			go_direction(direction)
			describe_current_room
		else
			puts "You cannot go that way."
		end
	end

	def go_direction(direction)
		case direction
		when "north"
			@y += 1
		when "east"
			@x += 1
		when "south"
			@y -= 1
		when "west"
			@x -= 1
		end

		@rooms[@x] = {} if @rooms[@x].nil?

		if @rooms[@x][@y].nil?
			@current_room = Room.new
			@current_room.exits = get_new_exits(@x, @y)
			store_room( @current_room, @x, @y)
		else
			@current_room = @rooms[@x][@y]
		end

		puts "You go #{direction}."
	end

	def get_new_exits(x,y)
		exits = []

		@rooms[x-1] = {} if @rooms[x-1].nil?
		@rooms[x+1] = {} if @rooms[x+1].nil?

		exits << "west" if get_exit_to_room(x-1, y, "east")
		exits << "east" if get_exit_to_room(x+1, y, "west")
		exits << "north" if get_exit_to_room(x, y+1, "south")
		exits << "south" if get_exit_to_room(x, y-1, "north")

		exits.join("|")
	end

	def get_exit_to_room(x, y, return_direction)
		if !@rooms[x][y].nil? && @rooms[x][y].has_exit?(return_direction)
			return true
		elsif @rooms[x][y].nil?
			return rand(0..1) == 0
		end
	end

	def get_coords
		return "You are now at #{@x},#{@y}."
	end

	def try_combat(player, target)
		@current_room.monsters.each do |monster|
			if monster.name == target
				Arena.new(player, monster)
				@current_room.remove_monster(monster) if Arena.won_fight?
				break
			end
		end
	end

	def display_map
		puts "\e[H\e[2J"
		bottom_left_x = @x - 40
		top_left_y = @y + 11

		(0..21).each do |y_off|
			(0..79).each do |x_off|
				x = bottom_left_x + x_off
				y = top_left_y - y_off

				if x == @x and y == @y
					print "x"
				elsif !@rooms[x].nil? && !@rooms[x][y].nil?
					print @rooms[x][y].get_map_tile
				else
					print " "
				end
			end
			puts ""
		end
	end
end
