class PetsController < ApplicationController

  before_action :find_pet, only: [:show, :story]

  def new
    @pet = Pet.new
    @personalities = Personality.types
  end

  def create
    @pet = Pet.new(name: pet_params[:name])
    @pet.personality = Personality.set_personality(pet_params[:personality], @pet)
    @pet.user = current_user
    @pet.new_story
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def show
    @story = StoryUpdate.new(@pet)

  end


private

  def pet_params
    params.require(:pet).permit(:name, :personality)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end

end
