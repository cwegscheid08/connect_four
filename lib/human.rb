class Human < Players
	attr_accessor :name, :game_piece

	def initialize(name, game_piece = nil)
		super
	end

	def guess
		puts "Where do you want to drop you piece?"
		gets.chomp.to_i
	end

	def get_game_piece
		puts "What is your game piece?"
		@game_piece.gets.chomp
	end

end