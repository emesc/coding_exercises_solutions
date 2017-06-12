require 'scrabble'

describe Scrabble do
  let(:letter_values) {
    <<-REF
    {
      "A": 1, "B": 3, "C": 3, "D": 2,
      "E": 1, "F": 4, "G": 2, "H": 4,
      "I": 1, "J": 8, "K": 5, "L": 1,
      "M": 3, "N": 1, "O": 1, "P": 3,
      "Q": 10, "R": 1, "S": 1, "T": 1,
      "U": 1, "V": 4, "W": 4, "X": 8,
      "Y": 4, "Z": 10
    }
    REF
  }

  before do
    @tile_values = Scrabble.letter_values
  end

  describe "game" do
    let(:game)   { Scrabble.new }

    it "loads letter values in expected form" do
      expect(@tile_values).to eq JSON.load(letter_values)
    end

    it "is case insensitive" do
      expect(game.score("HELLO")).to eq game.score("hello")
    end

    it "scores a proper word" do
      expect(game.score("word")).to eq 8
    end

    it "does not score an empty word" do
      expect(game.score("")).to eq 0
    end

    it "does not score a nil" do
      expect(game.score(nil)).to eq 0
    end

    it "does not score non-cambridge dictionary words" do
      expect(game.score("asdf")).to eq 0
    end

    it "does not score alphanumeric string" do
      expect(game.score("hello123")).to eq 0
    end

    it "does not score special characters" do
      expect(game.score("[][]")).to eq 0
    end
  end
end
