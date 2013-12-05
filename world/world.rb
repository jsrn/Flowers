require_relative "room.rb"

class World
	def initialize
		@x, @y = 0, 0
		@rooms = {}
		@current_room = Room.new
		@current_room.exits = "nesw"
		store_room( @current_room, @x, @y)
	end

	def describe_current_room
		@current_room.describe
	end

	def store_room( room, x, y )
		@rooms[x] = {} if @rooms[x].nil?
		@rooms[x][y] = room
	end
end