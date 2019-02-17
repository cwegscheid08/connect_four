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
		moves = [[-1,0],[1,0],[0,1],[0,-1],[-1,1],[1,1],[-1,-1],[1,-1]]

		@board.each do |key, value|
			# puts "KEY:#{key} VALUE:#{value}"
			value.each do |x, y|
				# puts "X:#{x} Y:#{y}"
				if !y.nil?
					moves.each do |move|
						if adjacent_cell_search(x, y, move) 
							return true
						end
					end

			 	# 	if adjacent_cell_search(x, y, moves.pop)
					# 	return true
					# end
				end
			end
		end

		false
	end

	def adjacent_cell_search(cell, value, move, bank = [])
		tmp = []
		bank.push(value)

		3.times do |x|
			if tmp[0].nil?
				
				array = []
				# puts "BANK:#{bank} TMP:#{tmp} ARRAY:#{array} CELL:#{cell} MOVE:#{move}"
				# print " FIRST\n"
				array.push(cell[0] + move[0])
				array.push(cell[1] + move[1])
				tmp.push(array)
			else
				
				array = []
				# puts "BANK:#{bank} TMP:#{tmp} ARRAY:#{array} CELL:#{cell} MOVE:#{move}"
				# print " FOLLOWING\n"
				array.push(tmp[-1][0] + move[0])
				array.push(tmp[-1][1] + move[1])
				tmp.push(array)
			end
			# puts "TMP:#{tmp[-1]} ON_BOARD:#{on_board?(tmp[-1])} "
			# puts on_board?(tmp[-1]) ? "PUSHING:#{bank.push(@board["column_#{tmp[-1][0]+1}"][tmp[-1]])}" : ""
			on_board?(tmp[-1]) ? bank.push(@board["column_#{tmp[-1][0]+1}"][tmp[-1]]) : ""
			# bank.push(tmp)
		end




		# THE COMPARISON AREA OF THIS WORKS TO TELL IF THE VALUES OF 
		# AN ARRAY ARE ALL EQL
		# puts "BANK:#{bank} SIZE:#{bank.size} "
		# if !bank[0].nil? && bank.size == 4 && bank.each { |x| x == value ? (print "TRUE "; true) : (print "FALSE "; return false) }
		if !bank[0].nil? && bank.size == 4 && bank.each { |x| x == value ? true : (return false) }
			puts "IN " 
			return true
		end
		# puts "OUT "
		return false
	end

	def on_board?(cell)
		# puts "CELL:#{cell}"
		(cell[0] < 7 && cell[1] < 6 && cell[0] >= 0 && cell[1] >= 0) ? true : false
	end

	def full?
		@board.each_key do |key|
			if @board[key].value?(nil)
				return false
			end
		end
		return true
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
				@board[key][cell] = "C"
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
