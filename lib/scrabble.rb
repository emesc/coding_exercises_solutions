require 'json'

class Scrabble
  class << self
    def letter_values_file
      filepath = File.join(File.dirname(__FILE__), "..", "data", "letter_values.json")
      File.read(filepath)
    end

    def letter_values_json
      JSON.load(letter_values_file)
    end
  end

  def initialize
    if self.class.letter_values_json
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
      !(word.nil? || word.match(/^[a-zA-Z]+$/).nil?)
    end

    def value(char)
      self.class.letter_values_json[char.upcase]
    end
end
