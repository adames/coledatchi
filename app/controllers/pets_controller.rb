class PetsController < ApplicationController

  before_action :find_pet, only: [:show, :story]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(name: pet_params[:name])
    @pet.user = current_user
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def show
  end

  def story
    @story = StoryUpdate.new(@pet)
    byebug


  end





private

  def pet_params
    params.require(:pet).permit(:name)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end

end
