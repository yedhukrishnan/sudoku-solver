require_relative './sudoku'

class SudokuSolver
  def initialize(sudoku)
    @sudoku = sudoku
  end

  def solve
    counter = (0..8).to_a
    while counter.product(counter).any? { |position| @sudoku.puzzle[position].nil? } do
      solve_iteration(counter)
    end
    @sudoku.puzzle
  end

  def solve_iteration counter
    counter.product(counter).each do |position|
      values = @sudoku.possible_values(position)
      @sudoku.update_position(position, values.first) if values.size == 1
    end
  end
end
