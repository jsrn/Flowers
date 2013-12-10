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

		if !@rooms[x-1][y].nil? && @rooms[x-1][y].has_exit?("east")
			exits << "west"
		end

		if !@rooms[x+1][y].nil? && @rooms[x+1][y].has_exit?("west")
			exits << "east"
		end

		if !@rooms[x][y+1].nil? && @rooms[x][y+1].has_exit?("south")
			exits << "north"
		end

		if !@rooms[x][y-1].nil? && @rooms[x][y-1].has_exit?("north")
			exits << "south"
		end

		exits.join("|")
	end

	def get_coords
		return "You are now at #{@x},#{@y}."
	end
end