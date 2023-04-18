require 'colorize'

class Bishop < Piece
  def initialize(color, pos)
    super(color, pos)
  end

	def symbol
    @color == :white ? "♗".colorize(:blue) : "♝".colorize(:red)
  end

  def valid_moves
		valid_moves = []
		current_row, current_col = @pos
	
		# check moves in diagonal directions
		[-1, 1].each do |row_dir|
			[-1, 1].each do |col_dir|
				(1..7).each do |distance|
					new_row = current_row + row_dir * distance
					new_col = current_col + col_dir * distance
					if new_row.between?(0, 7) && new_col.between?(0, 7)
						if @board[new_row, new_col].nil?
							# If the square is empty, add it to the list of valid moves
							valid_moves << [new_row, new_col]
						elsif @board[new_row, new_col].color != @color
							# If the square is occupied by an opponent's piece, add it to the list of valid moves and stop checking in this direction
							valid_moves << [new_row, new_col]
							break
						else
							# If the square is occupied by one of the player's own pieces, stop checking in this direction
							break
						end
					else
						# If we've reached the edge of the board, stop checking in this direction
						break
					end
				end
			end
		end
	
		valid_moves
	end
end
