movies_file = File.open("games.txt", "r")

movies = []
descriptions = []

movies_file.each_line.with_index do |line, index|
  if index.odd?
    descriptions << line.chomp
  else
    movies << line.chomp
  end
end

random_index = rand(movies.length)
random_movie = movies[random_index]
random_description = descriptions[random_index]

puts "Рекомендуемая игра: #{random_movie}"
puts "Описание: #{random_description}"