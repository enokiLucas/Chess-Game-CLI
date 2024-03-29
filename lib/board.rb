require 'colorize'

require_relative 'piece'
require_relative 'king'
require_relative 'queen'
require_relative 'bishop'
require_relative 'knight'
require_relative 'rook'
require_relative 'pawn'


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
      @grid[back_row][0] = Rook.new(color, [back_row, 0])
      @grid[back_row][7] = Rook.new(color, [back_row, 7])

      # Knights
      @grid[back_row][1] = Knight.new(color, [back_row, 1])
      @grid[back_row][6] = Knight.new(color, [back_row, 6])

      # Bishops
      @grid[back_row][2] = Bishop.new(color, [back_row, 2], self)
      @grid[back_row][5] = Bishop.new(color, [back_row, 5], self)

      # Queen
      @grid[back_row][3] = Queen.new(color, [back_row, 3])

      # King
      @grid[back_row][4] = King.new(color, [back_row, 4])
    end
  end

  def display
    puts "  A B C D E F G H "
    puts " +----------------+ "
    @grid.each_with_index do |row, i|
      print "#{8 - i}|"
      row.each_with_index do |piece, j|
        if piece.nil?
          if (i + j).even?
            print "   ".on_white
          else
            print "   ".on_black
          end
        else
          if (i + j).even?
            print " #{piece.symbol} ".on_white
          else
            print " #{piece.symbol} ".on_black
          end
        end
      end
      puts "|#{8 - i}"
    end
    puts " +----------------+ "
    puts "  A B C D E F G H "
  end


	def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end


  def setup_board
    @grid[0] = [
      Rook.new(:black, [0, 0]),
      Knight.new(:black, [0, 1]),
      Bishop.new(:black, [0, 2]),
      Queen.new(:black, [0, 3]),
      King.new(:black, [0, 4]),
      Bishop.new(:black, [0, 5]),
      Knight.new(:black, [0, 6]),
      Rook.new(:black, [0, 7])
    ]
    @grid[1] = Array.new(8) { |i| Pawn.new(:black, [1, i]) }
    @grid[6] = Array.new(8) { |i| Pawn.new(:white, [6, i]) }
    @grid[7] = [
      Rook.new(:white, [7, 0]),
      Knight.new(:white, [7, 1]),
      Bishop.new(:white, [7, 2]),
      Queen.new(:white, [7, 3]),
      King.new(:white, [7, 4]),
      Bishop.new(:white, [7, 5]),
      Knight.new(:white, [7, 6]),
      Rook.new(:white, [7, 7])
    ]
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    if piece.valid_moves.include?(end_pos)
      piece.move_to(end_pos)
      self[start_pos] = nil
      self[end_pos] = piece
    else
      raise "Invalid move"
    end
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
