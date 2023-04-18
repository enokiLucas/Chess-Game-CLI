require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/piece'
require_relative 'lib/pawn'
require_relative 'lib/knight'
require_relative 'lib/bishop'
require_relative 'lib/rook'
require_relative 'lib/queen'
require_relative 'lib/king'

board = Board.new
board.display

=begin
bishop = board[[0, 2]]
board.move_piece([0, 2], [2, 0])
puts bishop.pos # should output [2, 0]
=end

pawn = board[[1, 1]]
board.move_piece([1, 1], [2, 1])
puts pawn.pos

board.display
