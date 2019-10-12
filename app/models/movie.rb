class Movie < ActiveRecord::Base
    def self.AllRatings
        #will return ["G", "PG", "PG-13", "R"] only if a movie has that rating in all.
        return Movie.select(:rating).map(&:rating).uniq
    end

    #figure out how to only return those that are SELECTED
    def self.SelectedRatings
        return Movie.select(:rating).map(&:rating).uniq
    end

    def self.Find_all_with_rating(all_ratings)
        return Movie.where(rating: all_ratings)
    end

end
