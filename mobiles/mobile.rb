class Mobile

	attr_reader :level

	attr_reader :current_hp
	attr_reader	:str
	attr_reader :dex
	attr_reader :int

	attr_reader :name
	attr_reader :description

	def initialize
		@level ||= 1

		@str ||= 1
		@dex ||= 1
		@int ||= 1

		@current_hp = max_hp
	end

	def max_hp
		@str / 2 + 50
	end

	def describe
		puts ".--------------------------------------------------------\n"\
			 "| #{@name}\n"\
			 "| #{@description}\n"\
			 "| HP: #{@current_hp}/#{max_hp}\n"\
			 "| STR: #{@str} DEX: #{@dex} INT: #{@int}"
	end

end