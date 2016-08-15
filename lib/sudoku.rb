class Sudoku
  attr_accessor :puzzle
  attr_reader :initial_puzzle

  def initialize initial_puzzle
    @initial_puzzle = initial_puzzle
    @puzzle = initial_puzzle
  end

  def update_position position, value
    @puzzle[position] = value if @initial_puzzle[position].nil?
  end

  def possible_values position
    row, column = position
    (1..9).to_a - row_column_values(row, column) - group_values(row, column)
  end

  private

  def row_column_values row, column
    (0..8).collect do |i|
      [
        @puzzle[[row, i]],
        @puzzle[[i, column]]
      ]
    end.flatten.compact
  end

  def group_values row, column
    group_row = row - (row % 3)
    group_column = column - (column % 3)
    (group_row..group_row + 2).collect do |r|
      (group_column..group_column + 2).collect do |c|
        @puzzle[[r, c]]
      end
    end.flatten.compact
  end
end
