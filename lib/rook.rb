require 'colorize'

class Rook < Piece
  def initialize(color, pos)
    super(color, pos)
  end

	def symbol
    @color == :white ? "♖".colorize(:blue) : "♜".colorize(:red)
  end
	
  def valid_moves
    # return an array of valid moves for the rook
  end
end