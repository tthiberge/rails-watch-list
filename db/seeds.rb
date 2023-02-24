require 'open-uri'
require 'json'

puts "Cleaning"
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "seeding"

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_hash = JSON.parse(URI.open(url).read)
movies_results = movies_hash["results"]

# p movies_results

movies_results.each do |movie|
  img_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  Movie.create(
    title: movie['original_title'],
    overview: movie['overview'],
    poster_url: img_url,
    rating: movie['vote_average'])
end

# List.create(name: "Romance")
# List.create(name: "Action")
List.create(name: "Adventure")
List.create(name: "Anticipation")
List.create(name: "European")
List.create(name: "Asian")
# List.create(name: "Marvel")
# List.create(name: "Starwars")
# List.create(name: "Anime")
# List.create(name: "French movies")

puts "seeded"

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
