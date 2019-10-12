class Movie < ActiveRecord::Base
    def self.AllRatings
        return Movie.select(:rating).map(&:rating).uniq
    end

    def self.Find_all_with_rating(all_ratings)
        return Movie.where(rating: all_ratings)
    end

end
