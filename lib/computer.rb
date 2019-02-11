class Computer
	attr_accessor :name, :game_piece

	def initialize(name)
		@name = name
		@game_piece = "COMP"
	end

	def guess
		return rand(1..7)
	end
end