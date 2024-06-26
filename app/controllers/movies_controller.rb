class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @movies = Movie.order(created_at: :desc)

    respond_to do |format|
      format.json do
        render json: @movies
      end

      format.html
    end
  end

  def show
    @movie = Movie.find(params.fetch(:id))
    # the_id = params.fetch(:id)

    # matching_movies = Movie.where({ :id => the_id })

    # @the_movie = matching_movies.first

    # render({ :template => "movies/show" })
  end

  def create
    @movie = Movie.new(params.require(:movie).permit(:title, :description))
  
    # @movie = Movie.new
    # @movie.title = params.fetch(:movie).fetch(:title)
    # @movie.description = params.fetch(:movie).fetch(:description)

    if @movie.valid?
      @movie.save
      redirect_to movies_path, notice: "Movie created successfully."
    else
      render "movies/new"
    end
  end

  def edit
    the_id = params.fetch(:id)

    matching_movies = Movie.where({ :id => the_id })

    @the_movie = matching_movies.first

    # render({ :template => "movies/edit" })
  end

  def update
    the_id = params.fetch(:id)
    the_movie = Movie.where({ :id => the_id }).first

    the_movie.title = params.fetch("query_title")
    the_movie.description = params.fetch("query_description")

    if the_movie.valid?
      the_movie.save
      redirect_to("/movies/#{the_movie.id}", { :notice => "Movie updated successfully."} )
    else
      redirect_to("/movies/#{the_movie.id}", { :alert => "Movie failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch(:id)
    the_movie = Movie.where({ :id => the_id }).first

    the_movie.destroy

    redirect_to("/movies", { :notice => "Movie deleted successfully."} )
  end
end
