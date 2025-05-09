class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def create_new_director
   new_director = Director.new

    new_director.name = params.fetch("new_director_name")
    new_director.dob = params.fetch("new_director_dob")
    new_director.bio = params.fetch("new_director_bio")
    new_director.image = params.fetch("new_director_image")

    new_director.save

    redirect_to("/directors")
  end

  def destroy

    the_id = params.fetch("an_id")

    matching_records = Director.where({:id => the_id})

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/directors")
  end

  def update_director
    updated_director = Director.new
 
    updated_director.name = params.fetch("updated_director_name")
    updated_director.dob = params.fetch("updated_director_dob")
    updated_director.bio = params.fetch("updated_director_bio")
    updated_director.image = params.fetch("updated_director_image")  
    updated_director.save
  
     redirect_to("/directors")
   end
end
