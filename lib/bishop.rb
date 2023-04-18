require 'colorize'

class Bishop < Piece
  def initialize(color, pos, board)
    super(color, pos)
		@board = board
  end

	def symbol
    @color == :white ? "♗".colorize(:blue) : "♝".colorize(:red)
  end

  def valid_moves(end_pos)
    valid_moves = []
    current_row, current_col = @pos
    end_row, end_col = end_pos

    # check if end position is on the same diagonal as the bishop
    return valid_moves unless (current_row - end_row).abs == (current_col - end_col).abs

    # determine the direction of the diagonal movement
    row_dir = end_row <=> current_row
    col_dir = end_col <=> current_col

    # check each position along the diagonal path
    row, col = current_row + row_dir, current_col + col_dir
    while row != end_row && col != end_col
      return valid_moves unless row.between?(0, 7) && col.between?(0, 7)

      if @board[row, col].nil?
        valid_moves << [row, col]
      else
        break
      end

      row += row_dir
      col += col_dir
    end

    # check if the end position is valid
    if row.between?(0, 7) && col.between?(0, 7) && (@board[row, col].nil? || @board[row, col].color != @color)
      valid_moves << [row, col]
    end

    valid_moves
  end



end
