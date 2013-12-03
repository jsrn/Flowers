class Mobile

	attr_reader :level

	attr_reader :current_hp
	attr_reader	:str
	attr_reader :dex
	attr_reader :int

	attr_reader :name

	def initialize
		@level ||= 1
		set_stats(1, 1, 1)

		@current_hp = max_hp

	end

	def set_stats(str,dex,int)
		@str = str
		@dex = dex
		@int = int
	end

	def max_hp
		@str / 2 + 50
	end

end