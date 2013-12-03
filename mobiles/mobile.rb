class Mobile

	attr_reader :level

	attr_reader :current_hp
	attr_reader	:str
	attr_reader :dex
	attr_reader :int

	attr_reader :name

	def initialize
		@current_hp = max_hp
	end

	def set_stats(str,dex,int)
		@str = str
		@dex = dex
		@int = int
	end

	def max_hp
		77
	end

end