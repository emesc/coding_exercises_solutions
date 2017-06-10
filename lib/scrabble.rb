require 'json'

class Scrabble
  def self.letter_values
    data_path = File.join(File.dirname(__FILE__), "..", "data", "letter_values.json")
    letter_values = File.read(data_path)
    JSON.load(letter_values)
  end

  def initialize
    if loaded?(self.class.letter_values)
      puts "Letter values found"
    else
      puts "Letter values not found"
      exit!
    end
  end

  def score(word)
    valid?(word) ? word.chars.map { |char| value(char) }.reduce(:+) : 0
  end

  private
    def valid?(word)
      !word.to_s.empty?
    end

    def value(char)
      self.class.letter_values[char.upcase]
    end

    def loaded?(file)
      !!file
    end
end
