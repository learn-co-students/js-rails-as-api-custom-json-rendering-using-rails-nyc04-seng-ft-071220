class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    # render json: @birds, only: [:id, :name, :species]
    # render json: @birds, only: [:id, :name, :species]
    render json: @birds.to_json(except: [:created_at, :updated_at])

  end

  # def show 
  #   bird = Bird.find(params[:id])
  #   # render json: {id: bird.id, name: bird.name, species: bird.species}
  #   # render json: bird.slice(:id, :species)
  #   render json: bird, only: [:name, :species]
  # end 

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end
end