puts "Какая у тебя валюта на руках? (рубли/доллары)"
currency = gets.chomp.downcase

if currency == "рубли"
    puts "Введите сумму в рублях:"
    rubles = gets.to_f
    dollars = rubles /  73.67
    puts "#{rubles} рублей = #{dollars.round(2)} долларов"
elsif currency == "доллары"
    puts "Введите сумму в долларах:"
    dollars = gets.to_f
    rubles = dollars * 73.67
    puts "#{dollars} долларов = #{rubles.round(2)} рублей"
else
    puts "Не шарю за такую валюту."
end