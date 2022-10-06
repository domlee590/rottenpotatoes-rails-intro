class Movie < ActiveRecord::Base

  RATINGS = ['G','PG','PG-13','R']

  def self.with_ratings(ratings_list)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    return ratings_list != [] ? Movie.where(rating: ratings_list) : Movie.all
  end

  def self.all_ratings()
    return RATINGS
  end


end
