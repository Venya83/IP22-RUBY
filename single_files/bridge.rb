bridge_position = "closed"
bridge_created = false

while true
  puts "Введите команду:"
  input = gets.chomp.downcase

  case input
  when "создать мост"
    if bridge_created == false
      puts "Мост был создан"
      bridge_position = "closed"
      bridge_created = true
    else
      puts "Мост уже был создан"
    end
  when "раздвинуть мост"
    if bridge_created == true
      if bridge_position == "open"
        puts "Мост уже открыт"
      else
        puts "Мост раздвинут"
        bridge_position = "open"
      end
    else
      puts "Сначала нужно создать мост"
    end
  when "сдвинуть мост"
    if bridge_created == true
      if bridge_position == "closed"
        puts "Мост уже закрыт"
      else
        puts "Мост сдвинут"
        bridge_position = "closed"
      end
    else
      puts "Сначала нужно создать мост"
    end
  else
    puts "Некорректная команда"
  end
end
