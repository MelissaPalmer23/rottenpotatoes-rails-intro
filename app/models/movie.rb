class Movie < ActiveRecord::Base
    def self.AllRatings
        return Movie.select(:rating).map(&:rating).uniq
    end

    def self.Find_all_with_rating(hashMapOfRatings)
        #
        #Rating=hashMapOfRatings.keys

        Rating=@all_ratings.keys

        #return Movie.where(:rating : Rating)
        return Movie.all
    end
end
