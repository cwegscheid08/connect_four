class Computer < Players
	attr_accessor :name, :game_piece

	def initialize(name, game_piece)
		super
		@game_piece = "COMP"
	end

	def guess
		return rand(1..7)
	end
end