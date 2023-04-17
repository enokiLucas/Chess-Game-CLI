class Piece
  def initialize(color, pos)
    @color = color
    @pos = pos
  end

  def valid_moves
    raise NotImplementedError, "Subclass must implement abstract method"
  end

  def move_to(end_pos)
    @pos = end_pos
  end

  def symbol
    raise NotImplementedError, "Subclass must implement abstract method"
  end

	def pos
    @pos
  end
end