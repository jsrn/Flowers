class Room
	attr_accessor :exits
	attr_accessor :monsters

	def initialize
		@biome = "grass"
		@description = get_random_blurb
		@monsters = []
		generate_monsters
	end

	def describe
		puts @description
		puts "There are exits to the #{exit_long_form}."
		get_monsters_description
	end

	def generate_monsters
		@monsters << Orc.new if rand(0..1) == 1
		@monsters << Orc.new if rand(0..1) == 1
		@monsters << Drow.new if rand(0..1) == 1
	end

	def get_monsters_description
		if @monsters.length > 0
			names = @monsters.collect { |x| x.name }
			names_str = names.join(", ")
			puts "Lurking in the area you see #{names_str}."
		end
	end

	def exit_long_form
		exits = @exits.split("|")
		exits[-1] = "and " << exits[-1] if exits.length > 1
		exits.join(", ")
	end

	def get_random_blurb
		case @biome
		when "grass"
			return get_random_grass_blurb
		end
	end

	def get_random_grass_blurb
		[
			"You are in a grassy field.\n",
			"You are walking through some long grass and bushes.\n"
		].sample
	end

	def get_map_tile
		case @biome
		when "grass"
			return "."
		when "forest"
			return "^"
		end
	end

	def has_exit?(direction)
		@exits.split("|").include?(direction)
	end
end