require 'spec_helper'

def create_restaurant(name,description)
	restaurant = Restaurant.create({ :name => name, :description => description})
end

describe 'a restaurant' do

	before(:all) do
		create_restaurant('Fish Club','Fresh Fish and Chips')
	end

	it 'has its own page' do
		visit restaurants_path
		click_link 'Fish Club'

		expect(page).to have_content('Fresh Fish and Chips')
	end

	it 'can show the reviews of the restaurant' do
		Review.create(:review => 'Really good food', :score => 4, :restaurant_id => 1)
		visit restaurants_path

		click_link 'Fish Club'
		expect(page).to have_content 'Really good food'
	end

	it 'can show average the scores of the reviews' do
		Review.create(:review => 'Really good food', :score => 4, :restaurant_id => 1)
		Review.create(:review => 'Disgusting food', :score => 1, :restaurant_id => 1)
		visit restaurants_path

		click_link 'Fish Club'
		expect(page).to have_content 'Disgusting food'
	end
end

describe 'restaurants' do

	before(:all) do
		create_restaurant('Fish Club','Fresh Fish and Chips')
	end

	it 'show a list of restaurants' do
		create_restaurant('Counting House','Pub Food in the city')

		visit restaurants_path
		expect(page).to have_css 'li'
		expect(page).to have_content 'Fish Club'
		expect(page).to have_content 'Counting House'
	end

end


describe 'new restaurant form' do
	it 'can add a new restaurant' do
		visit new_restaurant_path

		fill_in 'Name', with: 'Nandos'
		fill_in 'Description', with: 'Tasty tasty chicken with lots of spice'
		click_button "Add Restaurant"

		expect(page).to have_content 'Tasty tasty chicken with lots of spice' 
	end

	it 'should not accept a new quiz without a title' do
      visit new_restaurant_path
      fill_in 'Description', with: 'Tasty tasty chicken with lots of spice'
      click_button "Add Restaurant"

      expect(page).to have_content 'error'
    end

    it 'should not accept a new quiz without a description' do
      visit new_restaurant_path
      fill_in 'Name', with: 'Nandos'
      click_button "Add Restaurant"

      expect(page).to have_content 'error'
    end
	
    it 'should not accept a new restaurant with the same name as another' do
      create_restaurant('KFC','Dirty Chicken')

      visit new_restaurant_path
      fill_in "Name", with: 'KFC'
      click_button 'Add Restaurant'

      expect(page).to have_content 'error'
    end

end
