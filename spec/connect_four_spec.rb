require './lib/game.rb'
require './lib/board.rb'
require './lib/human.rb'
require './lib/computer.rb'

RSpec.describe Game do 

	before do
		@game = Game.new("Chris")
	end

	describe "#who_is_playing" do
		it "returns which player who's turn it is." do
			@game.p1_turn = true
			expect(@game.who_is_playing.class).to eql(Human)
		end

		it "return player_2 when p1_turn is false." do
			@game.p1_turn = false
			expect(@game.who_is_playing.class).to eql(Computer)
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

RSpec.describe Board do
	before do
		@board = Board.new
	end

	describe "#full" do
		context "it returns true or false based on cell availability." do
			it "returns false if any board value is equal to NIL." do 
				expect(@board.full?).to eql(false)
			end

			it "returns true if no board value is equal to NIL." do 
				@board.fill
				expect(@board.full?).to eql(true)
			end
		end
	end

	describe "#place_piece" do
		it "returns the cell that the current player has put their piece in." do
			player_1 = Human.new("Chris", "C")
			expect(@board.place_piece(player_1, 4)).to eql([3,0])
		end

		it "returns the next cell equal to nil in the same column as the user input." do
			player_1 = Human.new("Chris", "C")
			@board.place_piece(player_1, 6)
			expect(@board.place_piece(player_1, 6)).to eql([5,1])
		end
	end
end


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