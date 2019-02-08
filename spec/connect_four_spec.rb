require './lib/game.rb'
require './lib/board.rb'
require './lib/players.rb'
require './lib/human.rb'
require './lib/computer.rb'

RSpec.describe Game do 
	describe "#round" do 
		it "returns either Human.guess or Computer.guess." do 
			game = Game.new
			expect(Game.round).to eql(Human.guess || Computer.guess)
	 	end
	end

	describe "#game_over?" do
		it "returns true if either player has won the game." do
			game = Game.new
			expect(Game.game_over?).to eql(false)
		end
	end

	describe "#player_wins" do
		it "returns a string stating which player has won the game." do
			game = Game.new
			expect(Game.game_over?).to eql("CHRIS has won!")
		end
	end

	describe "#who_is_playing?" do
		it "returns either 2 Human classes or 1 Human and 1 Computer class based on who is playing." do
			game = Game.new
			expect(Game.who_is_playing?).to eql(Human)
		end
	end
end

RSpec.describe Board do
	describe "#place_piece" do
		it "returns the cell that the current player has put their piece in." do
			board = Board.new
			expect(board.place_piece(player_1, 4)).to eql([3,0])
		end
	end
end

# RSpec.describe Players do
	
# end

# RSpec.describe Human do

# end

# RSpec.describe Computer do

# end