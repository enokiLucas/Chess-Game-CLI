# player_spec.rb
require_relative '../lib/player'

RSpec.describe Player do
  describe '#make_move' do
    let(:board) { double('board') }
    let(:player) { Player.new('Alice', :white) }

    before do
      allow(player).to receive(:gets).and_return("a2 a3\n")
      allow(board).to receive(:valid_move?).and_return(true)
      allow(board).to receive(:move_piece)
    end

    it "gets input from the user and moves a piece on the board" do
      expect(board).to receive(:display).at_least(:once)
      expect(player.make_move(board)).to be_nil
    end

    context "when an invalid move is entered" do
      before do
        allow(board).to receive(:valid_move?).and_return(false)
      end

      it "raises an error and retries" do
        expect(player).to receive(:puts).with("Invalid move entered")
        expect(player.make_move(board)).to be_nil
      end
    end
  end
end
