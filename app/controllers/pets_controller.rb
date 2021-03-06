class PetsController < ApplicationController
  def index
    @pets = Pet.all
    # @shelter = Shelter.find(params[:shelter_id])
  end

  def index_shelter
    @shelter = Shelter.find(params[:shelter_id])
    @pets = @shelter.pets.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @shelter = Shelter.find(params[:shelter_id])
    @shelter_id = params[:shelter_id]
  end

  def create
    pet = Pet.create!(pet_params)
    redirect_to "/shelters/#{pet.shelter_id}/pets"
  end

  def edit
    @pet = Pet.find(params[:id])
    @shelter = Shelter.find(@pet.shelter_id)
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to "/pets/#{@pet.id}"
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    # IF STATEMENT
    #  if coming from index.html.erb
        redirect_to "/pets"
    # else
        # redirect_to "/shelters/#{@shelter.id}/pets"
    # end

  end

  def destroy_from_shelter
    @pet = Pet.find(params[:id])
    @shelter = Shelter.find(@pet.shelter_id)
    @pet.destroy
    redirect_to "/shelters/#{@shelter.id}/pets"
  end

  private
  def pet_params
    params.permit(:image, :name, :approximate_age, :sex, :description, :shelter_id)
  end


end
