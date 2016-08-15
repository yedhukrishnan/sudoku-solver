require './lib/sudoku'

RSpec.describe Sudoku do
  let(:initial_puzzle) { { [0, 0] => 3, [4, 5] => 6 } }

  before(:example) do
    @sudoku = Sudoku.new initial_puzzle
  end

  describe "initialize" do
    it "creates a sudoku with initial puzzle" do
      expect(@sudoku.puzzle).to eq initial_puzzle
    end

    it "keeps the initial puzzle for future reference" do
      expect(@sudoku.initial_puzzle).to eq initial_puzzle
    end
  end

  describe "update position" do
    let(:position) { [3, 4] }
    let(:value) { 9 }

    before(:example) do
      @sudoku.update_position(position, value)
    end

    it "updates the position with given value" do
      expect(@sudoku.puzzle[position]).to eq value
    end

    it "does not modify the initial puzzle" do
      expect(@sudoku.initial_puzzle).to eq initial_puzzle
    end

    context "when the given position value is already given for the puzzle" do
      let(:already_given_position) { [0, 0] }

      before(:example) do
        @sudoku.update_position(already_given_position, value)
      end

      it "does not update the position" do
        expect(@sudoku.puzzle[already_given_position]).not_to eq value
      end
    end
  end

  describe "possible values" do
    before(:example) do
      @sudoku.update_position([0, 1], 1)
      @sudoku.update_position([2, 2], 4)
      @sudoku.update_position([0, 6], 6)
    end

    it "gives the list of possible values for that position" do
      expect(@sudoku.possible_values([0, 2])).to eq [2, 5, 7, 8, 9]
    end
  end

end
