puts "Выбери фильм: "
puts "1. Зелёная миля"
puts "2. Убить деБилла"
puts "3. Metal Gear Rising: Revengeace"

choice = gets.chomp.to_i

case choice
when 1
    puts "Фрэнк Дарабонт"
when 2
    puts "Квентин Тарантино"
when 3
    puts "Стефен Меанс"
else
    puts "Чегр?"
end