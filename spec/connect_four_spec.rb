require './lib/game.rb'
require './lib/board.rb'
require './lib/players.rb'
require './lib/human.rb'
require './lib/computer.rb'

RSpec.describe Game do 

	before do
		@game = Game.new("Chris")
	end

		describe "#round" do 
			it "return player_1.guess." do 
				# @game = Game.new
				@game.p1_turn = false
				expect(@game.round).to eql(@player_1.guess)
		 	end

		 	it "returns player_2.guess." do
		 		@game.p1_turn = true
		 		expect(@game.round).to eql(@player_2.guess)
		 	end
		end

		describe "#who_is_playing" do
			it "returns which player who's turn it is." do
				# @game = Game.new("Chris")
				expect(@game.who_is_playing).to eql(@player_1)
			end
		end

		# describe "#game_over?" do
		# 	it "contiues play if no one has won." do
		# 		# @game = Game.new("Chris")
		# 		board.four_in_a_row? = true
		# 		expect(@game.game_over?).to eql(true)
		# 	end

		# 	it "contiues to play the game if no one has won." do
		# 		# @game = Game.new
		# 		board.four_in_a_row? = false
		# 		expect(@game.game_over?).to eql(round(who_is_playing))
		# 	end
		# end

		# describe "#player_wins" do
		# 	it "returns a string stating which player has won the game." do
		# 		# @game = Game.new("Chris")
		# 		board.four_in_a_row? = true
		# 		expect(@game.game_over?).to eql("CHRIS has won!")
		# 	end

		# 	it "returns a string stating the player has lost if the computer wins." do
		# 		# @game = Game.new("Chris")
		# 		expect(@game.game_over?).to eql("You lose.")
		# 	end
		# end
end

# RSpec.describe Board do
# 	describe "#place_piece" do
# 		it "returns the cell that the current player has put their piece in." do
# 			board = Board.new
# 			expect(board.place_piece(player_1, 4)).to eql([3,0])
# 		end

# 		it "returns the next cell equal to nil in the same column as the user input." do
# 			board = Board.new
# 			board.cell[5,0] = player_1
# 			board.cell[5,1] = player_2
# 			expect(board.place_piece(player_1, 6)).to eql([5,2])
# 		end
# 	end

# 	describe "#full?" do
# 		it "returns false if there are still cells that are equal to nil." do
# 			board = Board.new
# 			expect(board.full?).to eql(false)
# 		end

# 		it "returns true if every cell on the board has a game_piece in them." do
# 			board = Board.new
# 			expect(board.full?).to eql(true)
# 		end
# 	end
# end

# RSpec.describe Players do
# 	describe "#guess" do
# 		it "returns an integer from 1-7 based on user inputs." do
# 			players = Players.new
# 			expect(players.player_guess).to eql(5)
# 		end
# 	end
# end

# RSpec.describe Human do
# 	describe "#guess" do
# 		it "returns an integer from 1-7 based on user inputs." do
# 			human = Human.new
# 			expect(human.player_guess).to eql(5)
# 		end
# 	end

# 	describe "#game_piece" do
# 		it "returns the player's selected symbol." do
# 			human = Human.new
# 			human.game_piece = "C"
# 			expect(human.game_piece).to eql("C")
# 		end
# 	end
# end

# RSpec.describe Computer do
# 	describe "#guess" do
# 		it "returns a random integer from 1-7 based on user inputs." do
# 			computer = Computer.new
# 			expect(Computer.player_guess).to eql(5)
# 		end
# 	end

# 	describe "#game_piece" do
# 		it "returns the computer's symbol."
# 			computer = Computer.new
# 			computer.game_piece = "Comp"
# 			expect(Computer.game_piece).to eql("Comp")
# 		end
# 	end
# end