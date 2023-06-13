guess = rand(16)
user_guess = nil

3.times do |i|
  puts "Попытка #{i + 1}: введите число от 0 до 15"
  user_guess = gets.chomp.to_i

  if user_guess == guess
    puts "Поздравляем, вы угадали число #{guess}!"
    break
  elsif (user_guess - guess).abs <= 2
    puts "Тепло! Нужно #{user_guess > guess ? 'меньше' : 'больше'}"
  else
    puts "Холодно! Нужно #{user_guess > guess ? 'меньше' : 'больше'}"
  end
end

puts "Было загадано число #{guess}" if guess != user_guess
