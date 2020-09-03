class Movie
  attr_accessor :title

  @@all = []

  def initialize(title)
    @title = title
    self.class.all << self
  end

  def self.all
    @@all
  end

  def reviews
    Review.all.select do |review|
      review.movie == self
    end
  end

  def reviewers
    self.reviews.map do |review|
      review.viewer
    end
  end

  def average_rating
    sum = 0
    average = 0.0
    self.reviews.each do |review|
      sum += review.rating
    end
    average = sum.to_f / self.reviews.length.to_f
  end

  def self.highest_rated
    review_ratings_sorted = Review.all.sort_by(&:rating)
    return review_ratings_sorted[review_ratings_sorted.count -1].movie
  end

end

