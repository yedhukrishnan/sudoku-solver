require './lib/sudoku'

RSpec.describe Sudoku do
  let(:initial_puzzle) { { [0, 0] => 3, [4, 5] => 6 } }

  before(:example) do
    @sudoku = Sudoku.new initial_puzzle
  end

  describe "initialize" do
    it "creates a sudoku with initial puzzle" do
      expect(@sudoku.puzzle).to equal initial_puzzle
    end

    it "keeps the initial puzzle for future reference" do
      expect(@sudoku.initial_puzzle).to equal initial_puzzle
    end
  end

  describe "update position" do
    let(:position) { [3, 4] }
    let(:value) { 9 }

    before(:example) do
      @sudoku.update_position(position, value)
    end

    it "updates the position with given value" do
      expect(@sudoku.puzzle[position]).to equal value
    end

    it "does not modify initial puzzle" do
      expect(@sudoku.initial_puzzle).to equal initial_puzzle
    end
  end

end
