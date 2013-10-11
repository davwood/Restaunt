require 'spec_helper'

def create_restaurant(name,description)
	restaurant = Restaurant.create({ :name => name, :description => description})
end

describe 'a review of a restaurant' do 
	before(:all) do
		create_restaurant('Fish Club','Fresh Fish and Chips')
	end

	it 'should review a restaurant with a score' do
		visit restaurants_path
		click_link 'Fish Club'

		fill_in 'Review', with: "It was really good food but bad service"
		fill_in 'Score', with: '4'
		click_button 'Submit Review'

		expect(page).to have_content("It was really good")
	end
	
end