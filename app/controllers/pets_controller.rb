class PetsController < ApplicationController

  before_action :find_pet, only: [:show, :story, :care, :action]

  def new
    @pet = Pet.generate_random
  end

  def create
    @pet = Pet.new(name: pet_params[:name])
    @pet.personality = Personality.set_personality(pet_params[:personality], @pet)
    @pet.species = Species.set_species(pet_params[:species])
    @pet.user = current_user
    @pet.new_story
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def show
    @story = StoryUpdate.new(@pet).perform
  end

  def care
  end

  def action
    @action = pet_params[:action].downcase
    @pet.send(@action)

    redirect_to pet_path(@pet)
  end


private

  def pet_params
    params.require(:pet).permit(:name, :personality, :action, :species)
  end

  def find_pet
    @pet = Pet.find(params[:id])
  end

end
