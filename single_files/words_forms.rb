def pluralize(num, singular, plural1, plural2)
    if (11..13).include?(num % 100)
      plural2
    else
      case num % 10
      when 1
        singular
      when 2..4
        plural1
      else
        plural2
      end
    end
  end
  
  puts "Введите число:"
  num = gets.chomp.to_i
  
  puts pluralize(num, "болт", "болта", "болтов")
