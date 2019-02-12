class Board
	attr_accessor :board	


	def initialize
		@board = build_board
		puts "BOARD:#{@board.to_s}"
	end

	def place_piece(player, player_guess, x = 0)
		if @board["column_#{player_guess}"][[player_guess-1,x]].nil?
			@board["column_#{player_guess}"][[player_guess-1,x]] = player.game_piece
			return [player_guess-1,x]
		else
			place_piece(player, player_guess, x+=1)
		end
	end

	def four_in_a_row?

	end

	def full?
		@board.each_key do |key|
			if @board[key].value?(nil)
				return false
			end
			return true
		end
	end

	def display
		@board.each_key { |key| print "#{key.upcase}   "}
		puts
		6.times do |x|
			@board.each_value do |value|
				print "[   #{value.values[5-x].nil? ? " " : value.values[5-x]}  ]   "
			end
			puts
		end
	end

	def fill
		@board.each_key do |key|
			@board[key].each_key do |cell|
				@board[key][cell] = "CHRIS"
			end
		end
	end


	private

	def build_board
		cell = {}
		column = {}
		x = 0
		y = 0
		7.times do
			6.times do
				cell[[x,y]] = nil
				y+=1
			end
			y = 0
			column["column_#{x+1}"] = cell
			cell = {}
			x += 1
		end
		@board = column
		
	end
end
