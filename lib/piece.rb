class Piece
  def initialize(color, pos)
    @color = color
    @pos = pos
  end

  def valid_moves
    # return an array of valid moves for the piece
  end

  def move_to(end_pos)
    # move the piece to the given position
  end

  def symbol
    # return the symbol representing the piece
  end
end