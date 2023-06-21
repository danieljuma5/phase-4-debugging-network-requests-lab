class ToysController < ApplicationController
  wrap_parameters format: []

  def index
    toys = Toy.all
    render json: toys
  end

  def create
    toy = Toy.create!(toy_params)
    render json: toy, status: :created
    rescue ActiveRecord::RecordInvalid => e
    render json: {errors: e.record.errors}, status: :unprocessable_entity
  end

  def update
    toy = Toy.find_by(id: params[:id])
    toy.update!(toy_params)
    render json: toy
    rescue ActiveRecord::RecordInvalid => e
    render json: {errors: e.record.errors}, status: :unprocessable_entity
  end

  def destroy
    toy = Toy.find(params[:id])
    toy.destroy
    # head :no_content
    render json: {}, status: :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Toy not found" }, status: :not_found
  end

  private
  
  def toy_params
    params.permit(:name, :image, :likes)
  end

end
