class Solution
  class << self
    def scrabble
      game = Scrabble.new
      word = get_command("word", "score")
      puts "Score is: #{game.score(word)}"
    end

    def credit
      account = get_command("number", "validate")
      credit_check = CreditCheck.new(account)
      puts "#{credit_check.valid?}" if credit_check.integer? account
    end

    def get_command(input, action)
      print "Enter a #{input} to #{action} > "
      gets.chomp.downcase.strip
    end
  end
end
