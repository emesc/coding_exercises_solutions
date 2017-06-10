require 'json'

class Scrabble
  class << self
    def letter_values
      data_path = File.join(File.dirname(__FILE__), "..", "data", "letter_values.json")
      letter_values = File.read(data_path)
      JSON.load(letter_values)
    end
  end

  def initialize
  end

  def score(word)
    valid?(word) ? word.strip.chars.map { |char| value(char) }.reduce(:+) : 0
  end

  private
    def valid?(word)
      !word.to_s.empty?
    end

    def value(char)
      self.class.letter_values[char.upcase]
    end
end
