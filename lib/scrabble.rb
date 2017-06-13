require 'json'
require 'meaning'

class Scrabble
  class << self
    def filepath
      File.join(File.dirname(__FILE__), "..", "data", "letter_values.json")
    end

    def read_values
      File.read(filepath)
    end

    def letter_values_json
      JSON.load(read_values)
    end
  end

  def initialize
    if letter_values_loaded?
      puts "Letter values found"
    else
      puts "Letter values not found"
      exit!
    end
  end

  def score(word)
    valid?(word) && english?(word) ? word.chars.map { |char| value(char) }.reduce(:+) : 0
  end

  private
    def valid?(word)
      !(word.nil? || word.match(/^[a-zA-Z]+$/).nil?)
    end

    def english?(word)
      word = Meaning::MeaningLab.new(word)
      word.dictionary[:error].nil?
    end

    def value(char)
      find_letter_values[char.upcase]
    end

    def letter_values_loaded?
      !!find_letter_values
    end

    def find_letter_values
      self.class.letter_values_json
    end
end
