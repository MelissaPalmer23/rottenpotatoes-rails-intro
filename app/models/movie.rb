class Movie < ActiveRecord::Base
    def self.AllRatings
        return Movie.select(:rating).map(&:rating).uniq
    end

    def self.Find_all_with_rating(HashMapOfRatings)
        #
        #Rating=hashMapOfRatings.keys

        Rating=HashMapOfRatings

        #return Movie.where(:rating : Rating)
        return Movie.all
    end
end
