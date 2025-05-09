class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create_new_movie
    new_movie = Movie.new
 
      new_movie.title = params.fetch("new_movie_title")
      new_movie.year = params.fetch("new_movie_year")
      new_movie.duration = params.fetch("new_movie_duration")
      new_movie.description = params.fetch("new_movie_description")
      new_movie.image = params.fetch("new_movie_image")
      new_movie.director_id = params.fetch("new_movie_director_id")  
      new_movie.save
  
     redirect_to("/movies")
   end  

  def destroy

    the_id = params.fetch("an_id")

    matching_records = Movie.where({:id => the_id})

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end

  def update_movie
    m_id = params.fetch("the_id")

    matching_records = Movie.where({:id => m_id})
    the_movie = matching_records.at(0)
 
    the_movie.title = params.fetch("the_title")
    the_movie.year = params.fetch("the_year")
    the_movie.duration = params.fetch("the_duration")
    the_movie.description = params.fetch("the_description")
    the_movie.image = params.fetch("the_image")
    the_movie.director_id = params.fetch("the_director_id")  
    the_movie.save
  
     redirect_to("/movies/#{the_movie.id}")
   end
end
