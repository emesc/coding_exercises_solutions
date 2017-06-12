class Solution
  class << self
    def scrabble(game)
      word = get_command("word", "score")
      puts "Score is: #{game.score(word)}"
    end

    def credit
      account = get_command("number", "validate")
      credit_check = CreditCheck.new(account)
      puts credit_check.integer?(account) && credit_check.valid? ? 
        "valid" : "invalid"
    end

    def get_command(input, action)
      puts "Enter a #{input} to #{action}"
      print "> "
      gets.chomp.downcase.strip
    end
  end
end
