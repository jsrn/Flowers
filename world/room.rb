class Room
	attr_accessor :exits
	attr_accessor :monsters
	attr_reader :biome

	def initialize
		@biome = "grass"
		@biome = "forest" if rand(0..1) == 1
		@description = Biome.blurb(@biome)
		@monsters = []
		generate_monsters
	end

	def describe
		puts @description
		puts "There are exits to the #{exit_long_form}."
		get_monsters_description
	end

	def generate_monsters
		rand(0..2).times do
			@monsters << Biome.monster(@biome).new
		end
	end

	def remove_monster(monster)
		@monsters.delete_at(@monsters.index(monster))
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

	def has_exit?(direction)
		@exits.split("|").include?(direction)
	end
end