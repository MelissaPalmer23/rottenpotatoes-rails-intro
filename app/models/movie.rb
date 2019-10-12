class Movie < ActiveRecord::Base
    def self.AllRatings
        return Movie.select(:rating).map(&:rating).uniq
    end

    def self.Find_all_with_rating(Ratings)
        #
        #Rating=hashMapOfRatings.keys


        #return Movie.where(:rating in Ratings)
        return Movie.all
    end
end
