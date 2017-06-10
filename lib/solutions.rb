class CodeTest
  class << self
    def scrabble
      game = Scrabble.new
      print "Enter a word to score > "
      word = gets.chomp.downcase.strip
      puts "Score is: #{game.score(word)}"
    end

    def credit
      print "Enter a number to validate > "
      account = gets.chomp.downcase.strip
      credit_check = CreditCheck.new(account)
      puts "#{credit_check.valid?}"
    end
  end
end
