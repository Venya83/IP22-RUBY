current_path = File.dirname(__FILE__)
file_eyes = File.join(current_path, "data", "eyes.txt")
file_eyes2 = File.join(current_path, "data", "eyes2.txt")
file_mouths = File.join(current_path, "data", "mouths.txt")

if File.exist?(file_eyes) && File.exist?(file_eyes2) && File.exist?(file_mouths)
  f_eyes = File.new(file_eyes, "r:UTF-8")
  f_eyes2 = File.new(file_eyes2, "r:UTF-8")
  f_mouths = File.new(file_mouths, "r:UTF-8")
  eyes1 = f_eyes.readlines.map(&:strip)
  eyes2 = f_eyes2.readlines.map(&:strip)
  mouths = f_mouths.readlines.map(&:strip)
  f_eyes.close
  f_eyes2.close
  f_mouths.close
  if eyes1.length > 0 && eyes2.length > 0 && mouths.length > 0
    selected_eye1 = eyes1.sample
    selected_eye2 = eyes2[eyes1.index(selected_eye1)]
    selected_mouth = mouths.sample
    if selected_eye1 && selected_eye2 && selected_mouth
      puts "#{selected_eye1}#{selected_mouth}#{selected_eye2}"
    else
      puts "Не удалось выбрать строку из 'eyes.txt', 'eyes2.txt' или 'mouths.txt'."
    end
  else
    puts "Файлы 'eyes.txt', 'eyes2.txt' и/или 'mouths.txt' не содержат строк."
  end
else
  puts "Файлы 'eyes.txt', 'eyes2.txt' и/или 'mouths.txt' не найдены."
end
