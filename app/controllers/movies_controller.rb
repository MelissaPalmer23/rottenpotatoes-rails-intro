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

    #working on session[]

    #This is so that the view includes those check boxes...
    @all_ratings=Movie.AllRatings

    #This is so that you filter based on those ratings.
    @SelectedRatings=params[:ratings]

    if params[:ratings].nil? and session[:ratings].nil?
        #if both selected and session rating is nill
        @SelectedRatings=@all_ratings
    elsif @SelectedRatings.nil?
        #if just selected is nil
        #Using the Ratings from the session
        #@SelectedRatings=@all_ratings
        @SelectedRatings=session[:ratings]
        redirect_to :sort_type="title", :ratings => @all_ratings and return
    else
        #selected rating isn't null
        @SelectedRatings=params[:ratings].keys
        session[:ratings]=params[:ratings]
    end

    @movies=Movie.Find_all_with_rating(@SelectedRatings)

    #dealing with highlighting and sorting columns

    if (defined? params[:sort_type])
        @sort_type=params[:sort_type]
        session[:sort_type]=params[:sort_type]
        if params[:sort_type]=="title"
            @movies=@movies.order(:title)
        else
            @movies=@movies.order(:release_date)

        end
    elsif (defined? session[:sort_type])
        #Params didn't specify a sort type but there was one from session
        @sort_type=session[:sort_type]
        if session[:sort_type]=="title"
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
