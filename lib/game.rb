class Game
	attr_accessor :player_1, :player_2, :p1_turn

	require './lib/board.rb'
	require './lib/players.rb'


	def initialize(player_1, player_2 = "computer")
		@p1_turn = false
		@player_1 = Players.new(player_1)
		@player_2 = Players.new(player_2)
	end

	def round
		@p1_turn ? @p1_turn = false : @p1_turn = true
		who_is_playing.guess
	end

	def game_over?

	end

	def player_wins

	end

	def start

	end

	def who_is_playing
		@p1_turn ? @player_1 : @player_2
	end

end