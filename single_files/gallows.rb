# Список слов для угадывания
words = ["выгода", "малина", "облока", "додик", "билли", "новатор", "ядро", "монтировка"]

# Выбираем случайное слово из списка
word = words.sample

# Количество попыток
turns = 5

# Создаем массив для хранения угаданных букв
guesses = []
word_array = word.split("")

# Заменяем все буквы слова на символ "_"
word_array.each_with_index do |letter, index|
  word_array[index] = "_"
end

# Игровой цикл
loop do
  puts "\nУ вас осталось #{turns} попыток."
  puts "Слово: #{word_array.join(" ")}"

  # Предлагаем игроку ввести букву
  print "Введите букву: "
  guess = gets.chomp.downcase

  # Если буква есть в слове, заменяем символ "_" на угаданную букву
  if word.include?(guess)
    word_array.each_with_index do |letter, index|
      if word[index] == guess
        word_array[index] = guess
      end
    end
    puts "Правильно!"
  else
    puts "Неправильно!"
    turns -= 1
  end

  # Добавляем букву в список угаданных букв, если ее там еще нет
  guesses << guess unless guesses.include?(guess)

  # Если все буквы угаданы, сообщаем об этом и завершаем игру
  if word_array.none? { |letter| letter == "_" }
    puts "Вы угадали слово! Поздравляем!"
    break
  end

  # Если попытки закончились, сообщаем об этом и завершаем игру
  if turns == 0
    puts "\nВы повесились! Загаданное слово было '#{word}'."
    break
  end
end
