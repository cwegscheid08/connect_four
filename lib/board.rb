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
		@board.each_key { |key| print "#{key.upcase}  "}
		puts

		7.times do |x|
			# x+=1
			# print "BOARD:#{@board["column_#{x}"].pop} X:#{x}\n"
			# @board["column_#{x}"]
			# print "#{@board.values.reverse[x].invert.values} \n"
			@board.each_value do |value|
				# print @board[value][x].invert.values
				# puts "VALUE:#{value} X:#{x}"
				print "#{value.keys[6-x]}   "
			end
			puts
		end

		# @board.each_key do |key|

		# end
		
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
			7.times do
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
