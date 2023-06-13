print "Соснёшь? (да/нет): "
answer = gets.chomp.downcase

if answer == "да"
    puts "Отлично!"
elsif answer == "нет"
    puts "А тебя никто не спрашивал!"
else
    puts "Непон."
end