class Knight < Piece
  def initialize(color, pos)
    super(color, pos)
  end

	def symbol
    color == :white ? "♘" : "♞"
  end

  def valid_moves
    # return an array of valid moves for the knight
  end
end
