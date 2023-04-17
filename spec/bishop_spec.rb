RSpec.describe Bishop do
  describe "#valid_moves" do
    context "when the bishop is in the middle of an empty board" do
      let(:bishop) { Bishop.new(:white, [3, 3]) }

      it "returns an array of diagonal moves" do
        expected_moves = [[2, 2], [1, 1], [0, 0], [2, 4], [1, 5], [0, 6], [4, 2], [5, 1], [6, 0], [4, 4], [5, 5], [6, 6], [7, 7]]
        expect(bishop.valid_moves).to match_array(expected_moves)
      end
    end

    context "when the bishop is blocked by other pieces" do
      let(:board) { ChessBoard.new }
      let(:bishop) { Bishop.new(:white, [3, 3]) }
      
      before do
        board.add_piece(bishop)
        board.add_piece(Pawn.new(:white, [2, 2]))
        board.add_piece(Pawn.new(:white, [4, 4]))
        board.add_piece(Pawn.new(:black, [2, 4]))
        board.add_piece(Pawn.new(:black, [4, 2]))
      end

      it "returns an array of valid moves that avoids the blocked squares" do
        expected_moves = [[2, 2], [1, 1], [2, 4], [4, 4], [5, 5], [6, 6], [7, 7]]
        expect(bishop.valid_moves).to match_array(expected_moves)
      end
    end
  end
end
