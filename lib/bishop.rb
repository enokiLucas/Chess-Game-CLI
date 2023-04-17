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
    (-7..7).each do |i|
      if i != 0
        new_row = current_row + i
        new_col = current_col + i
        if new_row.between?(0, 7) && new_col.between?(0, 7)
          valid_moves << [new_row, new_col]
        end
        new_row = current_row + i
        new_col = current_col - i
        if new_row.between?(0, 7) && new_col.between?(0, 7)
          valid_moves << [new_row, new_col]
        end
      end
    end

    valid_moves
  end
end
