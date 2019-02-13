class Game
	attr_accessor :board, :player_1, :player_2, :p1_turn

	require './lib/board.rb'
	require './lib/human.rb'
	require './lib/computer.rb'


	def initialize(player_1, player_2 = "computer")
		@p1_turn = false
		@player_1 = Human.new(player_1)
		player_2 == "computer" ? @player_2 = Computer.new(player_2) : @player_2 = Human.new(player_2)
		@board = Board.new
	end

	def round
		@p1_turn ? @p1_turn = false : @p1_turn = true
		@board.place_piece(who_is_playing, who_is_playing.guess)
		@board.display
	end

	def game_over?
		@board.four_in_a_row?
	end

	def player_wins
		puts "#{who_is_playing.name.upcase} WINS!!!"
	end

	def start
		until game_over?
			round
		end
		player_wins
	end

	def who_is_playing
		@p1_turn ? @player_1 : @player_2
	end

end