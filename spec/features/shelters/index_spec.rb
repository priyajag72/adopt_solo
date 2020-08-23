require 'rails_helper'

RSpec.describe "Shelters Index", type: :feature do
  describe "User" do
    before :each do
      @shelter_1 = Shelter.create!(name: "The Humane Society - Denver",
        address: "1 Place St",
        city: "Denver",
        state: "CO",
        zip: "11111")
      @shelter_2 = Shelter.create!(name: "Denver Animal Shelter",
        address: "7 There Blvd",
        city: "Denver",
        state: "CO",
        zip: "22222")
    end

    it "can see all shelter names" do
      visit "/shelters"
      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)
    end

    it "can see links to edit unique_shelter; style note: link 'next to' the shelter" do
      visit "/shelters"

      expect(page).to have_content(@shelter_1.name)
      expect(page).to have_content(@shelter_2.name)

      expect(page).to have_link('Edit Shelter')

      first(:link, 'Edit Shelter').click
      expect(current_path).to eq("/shelters/#{@shelter_1.id}/edit")
    end
  end
end
