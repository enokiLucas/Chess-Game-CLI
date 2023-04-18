require 'colorize'
require_relative 'board'

class Pawn < Piece
  def initialize(color, pos, board)
    super(color, pos)
		@board = board
		@forward_dir = (@color == :white ? -1 : 1)
    @start_row = (@color == :white ? 6 : 1)
  end

	def symbol
    @color == :white ? "♙".colorize(:blue) : "♟".colorize(:red)
  end

  def valid_moves
		moves = []
    row, col = @pos

    # one or two squares forward
    one_sq_fwd = [row + @forward_dir, col]
    two_sqs_fwd = [row + 2 * @forward_dir, col]
    if @board[one_sq_fwd].nil?
      moves << one_sq_fwd
      moves << two_sqs_fwd if row == @start_row && @board[two_sqs_fwd].nil?
    end

    # capture diagonally
    [-1, 1].each do |col_offset|
      diag_pos = [row + @forward_dir, col + col_offset]
      if diag_pos.all? { |coord| coord.between?(0, 7) } &&
          @board[diag_pos] && @board[diag_pos].color != @color
        moves << diag_pos
      end
    end
=begin
    # en passant
    if @board.en_passant && row == @board.en_passant[0]
      left_pos = [row, col - 1]
      right_pos = [row, col + 1]
      if @board.en_passant[1] == col - 1 &&
          @board[left_pos] && @board[left_pos].color != @color &&
          @board[left_pos].is_a?(Pawn) && @board[left_pos].just_moved_two?
        moves << [row + @forward_dir, col - 1]
      elsif @board.en_passant[1] == col + 1 &&
          @board[right_pos] && @board[right_pos].color != @color &&
          @board[right_pos].is_a?(Pawn) && @board[right_pos].just_moved_two?
        moves << [row + @forward_dir, col + 1]
      end
    end
=end
    moves
  end
end