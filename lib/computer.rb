class Computer
	attr_accessor :name, :game_piece

	def initialize(name)
		@name = name
		@game_piece = "X"
	end

	def guess
		puts "\n\nI'M THINKING...\n"
		sleep(1)
		return rand(1..7)
	end
end