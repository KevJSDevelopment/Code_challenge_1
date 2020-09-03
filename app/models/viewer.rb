class Viewer
  attr_accessor :username

  @@all = []

  def initialize(username)
    @username = username
    self.class.all << self
  end

  def self.all
    @@all
  end
  
  def reviews
    Review.all.select do |review|
      review.viewer == self
    end
  end

  def reviewed_movies
    self.reviews.map do |review|
      review.movie
    end
  end

  def reviewed_movie?(movie)
    self.reviewed_movies.include?(movie)
  end

  def rate_movie(movie, rating)
    found_review = self.reviews.find do |review|
      review.movie == movie
    end
    if found_review == nil
      found_review = Review.new(self, movie, rating)
    else
      found_review.rating = rating
    end
  end
  
end

