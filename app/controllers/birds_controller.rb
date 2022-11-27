class BirdsController < ApplicationController

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def create
    new_bird = Bird.create(bird_params)
    render json: new_bird, status: :created
  end

  private

  def bird_params
    params.permit(:name, :species)
  end
end