# require and load the environment file
require_relative '../config/environment.rb'

# call this method to reload your models as you write code
def reload
  load 'config/environment.rb'
end

# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


viewer1 = Viewer.new("Viewer_1")
viewer2 = Viewer.new("Viewer_2")
viewer3 = Viewer.new("Viewer_3")

movie1 = Movie.new("Movie_1")
movie2 = Movie.new("Movie_2")
movie3 = Movie.new("Movie_3")

review1 = Review.new(viewer1, movie1, 7)
review2 = Review.new(viewer3, movie2, 5)
review3 = Review.new(viewer2, movie1, 10)

puts "checking that you can get all movies & viewers"
p Viewer.all
p Movie.all

puts "checking that you can get all ratings"
p Review.all

puts "checking to make sure movie2.reviews works"
p movie2.reviews == [review2]

puts "checking to make sure movie1.reviewers works"
p movie1.reviewers == [viewer1, viewer2]

puts "make sure viewer2.reviews works"
p viewer2.reviews == [review3]

puts "make sure viewer1.reviewed_movies works"
p viewer1.reviewed_movies == [movie1]

puts "checking if viewer2.reviewed_movie?(movie1) == true"
p viewer2.reviewed_movie?(movie1)
puts "checking if viewer2.reviewed_movie?(movie3) == false"
p viewer2.reviewed_movie?(movie3)

puts "expect viewer1.rate_movie(movie3, 6) to create a new review"
#p Review.all
p viewer1.rate_movie(movie3, 6)
p Review.all

puts "expect viewer1.rate_movie(movie1, 2) to change review1.rating to 2"
#p Review.all
p viewer1.rate_movie(movie1, 2)
p Review.all

puts "expect movie1.average_rating to be 6 (10 + 2 / 2)"
p movie1.average_rating

puts "expect movie with the highest rating to be movie1"
p Movie.highest_rated

# ===== WARNING! DO NOT EDIT BELOW THIS LINE ===== #
binding.pry
0
