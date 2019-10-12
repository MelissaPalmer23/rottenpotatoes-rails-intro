class Movie < ActiveRecord::Base
    def self.AllRating
        return Movie.select(:rating).map(&:rating).uniq
    end
end
