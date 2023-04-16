class Board
	attr_accessor :grid 

  def initialize
    @grid = Array.new(8) { Array.new(8) }

    # Set up the starting positions of the pieces
    [:white, :black].each do |color|
      back_row = color == :white ? 7 : 0
      front_row = color == :white ? 6 : 1

      # Pawns
      (0..7).each do |col|
        @grid[front_row][col] = Pawn.new(color, [front_row, col], self)
      end

      # Rooks
      @grid[back_row][0] = Rook.new(color, [back_row, 0], self)
      @grid[back_row][7] = Rook.new(color, [back_row, 7], self)

      # Knights
      @grid[back_row][1] = Knight.new(color, [back_row, 1], self)
      @grid[back_row][6] = Knight.new(color, [back_row, 6], self)

      # Bishops
      @grid[back_row][2] = Bishop.new(color, [back_row, 2], self)
      @grid[back_row][5] = Bishop.new(color, [back_row, 5], self)

      # Queen
      @grid[back_row][3] = Queen.new(color, [back_row, 3], self)

      # King
      @grid[back_row][4] = King.new(color, [back_row, 4], self)
    end
  end

  def display
    # display the board
  end

  def move_piece(start_pos, end_pos)
    # move a piece from start_pos to end_pos
  end

  def valid_move?(start_pos, end_pos)
    # check if the move is valid
  end

  def in_check?(color)
    # check if the king of the given color is in check
  end

  def checkmate?(color)
    # check if the game is in checkmate for the given color
  end

  def stalemate?(color)
    # check if the game is in stalemate for the given color
  end

  def promote_pawn(pawn_position)
    # promote a pawn to a queen, knight, bishop or rook
  end

  def castling?(start_pos, end_pos)
    # check if the move is castling
  end

  def en_passant?(start_pos, end_pos)
    # check if the move is en passant
  end

  def fifty_moves_rule?
    # check if the 50-move rule has been triggered
  end

  def insufficient_material?
    # check if the game is in a state of insufficient material to checkmate
  end

  def threefold_repetition?
    # check if the game has reached a threefold repetition
  end
end
