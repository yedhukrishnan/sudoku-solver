require './sudoku'

class SudokuInputReader
  def create_sudoku
    puts "Input the initial sudoku :"
    initial_sudoku_hash = Hash.new
    (0..8).each do |row|
      initial_sudoku_hash.merge! row_hash(row)
    end
    Sudoku.new(initial_sudoku_hash)
  end

  def row_hash row
    line = gets
    Hash[line.split(' ').each_with_index.collect { |value, col| [[row, col], value.to_i] }]
  end
end
