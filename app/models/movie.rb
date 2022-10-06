class Movie < ActiveRecord::Base

  RATINGS = ['G','PG','PG-13','R']


  def self.get_movies(ratings_list, order)

    if ratings_list != [] and order
      res = Movie.where(rating: ratings_list).order(order)
    elsif ratings_list != []
      res = Movie.where(rating: ratings_list)
    elsif order
      res = Movie.all.order(order)
    else
      res = Movie.all
    end

    return res

  end

  def self.with_ratings(ratings_list)
    # if ratings_list is an array such as ['G', 'PG', 'R'], retrieve all
    #  movies with those ratings
    # if ratings_list is nil, retrieve ALL movies
    return ratings_list != [] ? Movie.where(rating: ratings_list) : Movie.all
  end

  def self.sorted(order)
    return Movie.all.order(order)
  end

  def self.all_ratings()
    return RATINGS
  end


end
