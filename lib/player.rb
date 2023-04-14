require_relative 'board'

class Player
  attr_reader :color, :name

  def initialize(name, color)
    @name = name
    @color = color
  end

	def make_move(board)
    puts "It's #{@color}'s turn."
    puts board.display
    puts "Enter your move in the format 'start_position end_position':"

    input = gets.chomp
		
    start_pos, end_pos = input.split.map do |pos| 
			pos_to_coord(pos)
		end

    raise "Invalid move entered" unless board.valid_move?(start_pos, end_pos)

    board.move_piece(start_pos, end_pos)
		
  rescue StandardError => e
    puts e.message
    retry
  end

  private

  def pos_to_coord(pos)
		column = pos[0].ord - "a".ord
		row = 8 - pos[1].to_i
		[row, column]
	end
end
