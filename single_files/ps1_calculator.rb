def add(a, b)
  a + b
end

def subtract(a, b)
  a - b
end

def multiply(a, b)
  a * b
end

def divide(a, b)
  if b.zero?
    if a.positive?
      return "Infinity"
    elsif a.negative?
      return "-Infinity"
    else
      return "Undefined"
    end
  end
  a / b
end

puts "Введите первое число:"
num1 = gets.chomp.to_i

puts "Введите второе число:"
num2 = gets.chomp.to_i

puts "Выберите операцию:"
puts "1. Сложение"
puts "2. Вычитание"
puts "3. Умножение"
puts "4. Деление"

operation = gets.chomp.to_i

case operation
when 1
  result = add(num1, num2)
  operator = "+"
when 2
  result = subtract(num1, num2)
  operator = "-"
when 3
  result = multiply(num1, num2)
  operator = "*"
when 4
  result = divide(num1, num2)
  operator = "/"
else
  puts "Неверная операция"
  exit
end

puts "Результат: #{num1} #{operator} #{num2} = #{result}"
