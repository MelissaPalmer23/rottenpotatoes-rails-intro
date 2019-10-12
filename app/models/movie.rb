class Movie < ActiveRecord::Base
    def self.AllRatings
        return Movie.select(:rating).map(&:rating).uniq
    end
end
