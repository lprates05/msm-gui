class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create_new_actor
      new_actor = Director.new
  
      new_actor.name = params.fetch("new_actor_name")
      new_actor.dob = params.fetch("new_actor_dob")
      new_actor.bio = params.fetch("new_actor_bio")
      new_actor.image = params.fetch("new_actor_image")
  
      new_actor.save
  
     redirect_to("/actors")
   end
end
