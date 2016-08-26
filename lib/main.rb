require_relative "./sudoku_solver"
require_relative "./sudoku_input_reader"

def print_sudoku(puzzle)
  counter = (0..8).to_a
  puts "printing sudoku"
  counter.each do |row|
    row_values = counter.collect { |col| puzzle[[row, col]] || 0 }
    puts "#{row_values.join(' | ')}"
    puts "---------------------------------"
  end
end

sudoku = Sudoku.new({[0, 2]=>7, [0, 5]=>1, [0, 8]=>2, [1, 1]=>6, [1, 4]=>4, [1, 7]=>9, [2, 3]=>3, [3, 2]=>2, [3, 5]=>8, [3, 8]=>7, [4, 7]=>6, [5, 0]=>3, [5, 3]=>9, [5, 6]=>5, [6, 2]=>5, [6, 4]=>2, [6, 8]=>8, [7, 1]=>4, [7, 5]=>7, [8, 3]=>6, [8, 7]=>3})

#sir = SudokuInputReader.new
#sudoku = sir.create_sudoku

print_sudoku(sudoku.puzzle)

ss = SudokuSolver.new(sudoku)
print_sudoku(ss.solve())
