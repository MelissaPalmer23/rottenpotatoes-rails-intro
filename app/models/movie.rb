class Movie < ActiveRecord::Base
    def self.AllRatings
        return Movie.select(:rating).map(&:rating).uniq
    end

    def self.Find_all_with_rating(all_ratings)

        return Movie.where(rating in all_ratings)
        #return Movie.all
    end

end
