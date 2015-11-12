require 'spec_helper'

feature 'Sign In' do
	scenario "Sign In" do
		user= FactoryGirl.create(:user)
		visit '/'
		click_link "Log In"
		fill_in "Email", with: user.email		
		fill_in "Password", with: user.password 

		click_button "Log In"

		expect(page).to have_content("¡Hola, otra vez! ¡Que gusto verte!")
	end
end