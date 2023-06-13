CHOICES = { "к" => "Камень", "н" => "Ножницы", "б" => "Бумага" }
WEAPON_CHOICES = CHOICES.merge("т" => "Травмат")
WEAPON_PROBABILITY = 0.3

puts "Камень-Ножницы-Бумага"
loop do
  puts "Выберите (к)амень, (н)ожницы или (б)умагу:"
  player_choice = gets.chomp.downcase

  unless CHOICES.keys.include?(player_choice)
    puts "Кого? Выбирай нормально."
    next
  end

  computer_choice = if rand < WEAPON_PROBABILITY
                      "т"
                    else
                      CHOICES.keys.sample
                    end
  puts "#{WEAPON_CHOICES[computer_choice]}."

  if player_choice == computer_choice
    puts "Ничья!"
  elsif (player_choice == "к" && computer_choice == "н") ||
        (player_choice == "н" && computer_choice == "б") ||
        (player_choice == "б" && computer_choice == "к")
    puts "Ты выиграл!"
  elsif player_choice != "т" && computer_choice == "т"
    puts "Ты проиграл!"
  else
    puts "Ты проиграл!"
  end

  puts "Ещё хочешь? (да/нет)"
  answer = gets.chomp.downcase
  break unless answer == "да"
end

puts "Ясно, слился..."
