class CreditCheck
  attr_reader :check_digit, :account

  def initialize(account_string)
    if integer? account_string
      @account = account_string.chars.map(&:to_i)
      @check_digit = account.last
    else
      puts "Please enter an account number"
    end
  end

  def double_every_other_digit
    account.reverse.map.with_index { |n, i| i.odd? ? n * 2 : n }.reverse
  end

  def sum_digits_over_10
    double_every_other_digit.map { |n| n >= 10 ? n.to_s.chars.map(&:to_i).reduce(:+) : n }
  end

  def sum_results
    sum_digits_over_10.reduce(:+)
  end

  def valid?
    sum_results % 10 == 0 ? true : false
  rescue
    false
  end

  def integer?(input)
    !!input.match(/^[\d]+$/)
  end
end
