#!/usr/bin/env ruby

Dir[File.expand_path("./lib/**/*.rb")].each { |f| require f }
COMMANDS = %w(credit scrabble)
game = Scrabble.new

loop do
  puts  "\nCommands: #{COMMANDS.join(" or ")} (quit to exit)"
  print "> "
  input = gets.chomp.downcase.strip

  if input == "quit"
    puts "\n<<< Thank you and goodbye :-) >>>\n\n"
    break
  elsif COMMANDS.include? input
    input == COMMANDS.last ? Solution.send(input, game) : Solution.send(input)
  else
    puts "\nI don't understand that command"
  end
end
