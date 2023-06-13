require 'set'

# Определяем массив слов, которые будут использоваться в игре
WORDS = Set.new(['cat', 'dog', 'hat', 'mat', 'bat', 'rat', 'sat', 'pat'])

# Генерируем случайную букву для звездочки
letter = ('a'..'z').to_a.sample

# Генерируем строку из букв и звездочек
word = "c*t"

puts "Слово: #{word}"
puts "Введите слова, подходящие под шаблон, или 'exit' для выхода."

loop do
  input = gets.chomp
  break if input == "exit"
  
  if WORDS.include?(input) && input.length == word.length
    # Проверяем, подходит ли введенное слово под шаблон
    if word.gsub("*", letter) == input
      puts "Правильно!"
    else
      puts "Неправильно. Попробуйте еще раз."
    end
  else
    puts "Неверное слово. Попробуйте еще раз."
  end
end

puts "Игра завершена."
