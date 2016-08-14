class Sudoku
  attr_accessor :puzzle
  attr_reader :initial_puzzle

  def initialize initial_puzzle
    @initial_puzzle = initial_puzzle
    @puzzle = initial_puzzle
  end

  def update_position position, value
    @puzzle[position] = value
  end
end
