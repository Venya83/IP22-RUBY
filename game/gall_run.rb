require_relative "game"
require_relative "result"
slovo = ARGV[0]

game = Game.new(slovo)
printer = ResultPrinter.new
while game.status == 0 do
    printer.print_status(game)
    game.ask_next_letter
end

printer.print_status(game)