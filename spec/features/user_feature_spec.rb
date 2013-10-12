require 'spec_helper'

describe "User pages" do

  describe 'new user form' do
      
      it 'creates a new user' do
        visit sign_up_path

        within '.new_user' do
          fill_in 'First name', with: 'Bob'
          fill_in 'Last name', with: 'Job'
          fill_in 'Email', with: 'bob@job.com'
          fill_in 'Password', with: 'password'
          fill_in 'Password confirmation', with: 'password'

          click_button "Sign up"
        end

        expect(current_url).to eq root_url
        expect(page).to have_content 'Welcome to Restaunt, Bob'
      end

    end

end