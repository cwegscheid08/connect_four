class Board
	attr_accessor :board	


	def initialize
		@board = build_board
		puts "BOARD:#{@board.to_s}"
	end

	def place_piece(player, player_guess, x = 0)
		if @board["column_#{player_guess}"][[player_guess-1,x]].nil?
			@board["column_#{player_guess}"][[player_guess-1,x]] = player.game_piece
		else
			place_piece(player, player_guess, x+=1)
		end
	end

	def four_in_a_row?

	end

	def full?
		# @board.each_value { |value| puts "VALUE:#{value}"}
		@board.each_value do |cells|
			cells.each_value { |value| puts "VALUE:#{value}"}
		end
	end

	def display
		@board.each_key { |key| print "#{key.upcase} "}
		puts
		7.times { |x| puts "BOARD:#{@board['column_#{x+1}'].nil?}"}
		# @board.each do 
		# 	x = 0
		# 	print "\n#{@board['column_#{x+1}']}\n\n"
		# 	# print " VALUE:#{value}\n"
		# 	@board['column_#{x+1}'].each { |y| puts "Y:#{y}"}
		# end
	end


	private

	def build_board
		cell = {}
		column = {}
		x = 0
		y = 0
		6.times do
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