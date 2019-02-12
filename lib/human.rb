class Human
	attr_accessor :name, :game_piece

	def initialize(name, game_piece = nil)
		@name = name
		game_piece.nil? ? @game_piece = get_game_piece : @game_piece = game_piece
	end

	def guess
		puts "Where do you want to drop you piece?"
		return gets.chomp.to_i
	end

	def get_game_piece
		@game_piece = @name[0].upcase
	end

end