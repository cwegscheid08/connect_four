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


	# def four_in_a_row?
	# 	moves = [[-1,0],[1,0],[0,1],[0,-1],[-1,1],[1,1],[-1,-1],[1,-1]]

	# 	@board.each do |key, value|
	# 		puts "KEY:#{key} VALUE:#{value}"
	# 		value.each do |x, y|
	# 			puts "X:#{x} Y:#{y}"
	# 			if !y.nil?
	# 		 		adjacent_cell_search(x, y, moves.pop)
	# 					return true
	# 				end
	# 			end
	# 		end
	# 	end

	# 	false
	# end

	# def adjacent_cell_search(cell, value, move, bank = [])
	# 	tmp = cell

	# 	3.times do 
	# 		tmp.map! do |tmp_cell|
	# 			tmp_cell[0]+=move[0]
	# 			tmp_cell[1]+=move[1]
	# 		end

	# 	end




	# 	# THE COMPARISON AREA OF THIS WORKS TO TELL IF THE VALUES OF 
	# 	# AN ARRAY ARE ALL EQL
	# 	puts "BANK:#{bank} "
	# 	if !bank[0].nil? && bank.each { |x| x == value ? true : false }
	# 		puts "IN " 
	# 		return true
	# 	end
	# 	puts "OUT "
	# 	false
	# end

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
