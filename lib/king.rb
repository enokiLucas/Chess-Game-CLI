class King < Piece

  def initialize(color, pos)
    super(color, pos)
  end

	def symbol
    if @color == :white
      "♔"
    else
      "♚"
    end
  end

  def valid_moves
    # return an array of valid moves for the king
  end
end