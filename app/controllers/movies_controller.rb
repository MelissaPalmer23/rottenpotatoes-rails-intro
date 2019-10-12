class MoviesController < ApplicationController


  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    #@movies = Movie.all

    #dealing with checkboxes

    #This is so that the view includes those check boxes...
    @all_ratings=Movie.AllRatings

    #This is so that you filter based on those ratings.
    #@SelectedRatings=Movie.SelectedRatings
    #@movies=Movie.Find_all_with_rating(@SelectedRatings)
    @SelectedRatings=params[:ratings]
    if @SelectedRatings.nil?
        @SelectedRatings=@all_ratings
    else
        @SelectedRatings=params[:ratings].keys
    end

    @movies=Movie.Find_all_with_rating(@SelectedRatings)

    #dealing with highlighting and sorting columns
    if (defined? params[:sort_type])
        @sort_type=params[:sort_type]

        if params[:sort_type]=="title"
            @movies=@movies.order(:title)
        else
            @movies=@movies.order(:release_date)
        end
    end



  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end


end
