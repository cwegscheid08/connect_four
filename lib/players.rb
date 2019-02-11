class Players
	attr_accessor :name, :game_piece, :player

	require './lib/human.rb'
	require './lib/computer.rb'

	def initialize(name, game_piece = nil)
		name == "computer" ? @player = Computer.new(name) : @player = Human.new(name)
		game_piece.nil? ? get_game_piece : ""

	end

end