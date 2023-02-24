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


file_Adventure = URI.open("https://images.unsplash.com/photo-1655514514831-5bfefa52f500?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=902&q=80")
list_Adventure = List.new(name: "Adventure")
list_Adventure.photo.attach(io: file_Adventure, filename: "Adventure.png", content_type: "image/png")
list_Adventure.save

file_Anticipation = URI.open("https://images.unsplash.com/photo-1478720568477-152d9b164e26?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
list_Anticipation = List.new(name: "Anticipation")
list_Anticipation.photo.attach(io: file_Anticipation, filename: "Anticipation.png", content_type: "image/png")
list_Anticipation.save

file_European = URI.open("https://images.unsplash.com/photo-1608817576152-26bbdb00afb7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=921&q=80")
list_European = List.new(name: "European")
list_European.photo.attach(io: file_European, filename: "European.png", content_type: "image/png")
list_European.save

file_Asian = URI.open("https://plus.unsplash.com/premium_photo-1661882377491-c5685537447f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")
list_Asian = List.new(name: "Asian")
list_Asian.photo.attach(io: file_Asian, filename: "Asian.png", content_type: "image/png")
list_Asian.save


puts "seeded"

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
