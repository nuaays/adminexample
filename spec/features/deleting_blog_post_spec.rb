require 'spec_helper'

feature "Deleting Posts" do
	let!(:admin_user) {FactoryGirl.create(:admin_user)}
	let!(:post) do
  		post = FactoryGirl.create(:post, name:"Pierde Muchos Fondos")
  		post.update(user: admin_user)
  		post
	end
	
	before do
		log_in_as!(admin_user)
		visit posts_path
		click_link "Pierde Muchos Fondos"
		click_link "Delete Post"
	end
	scenario "Deleting a post" do
		

		expect(page).to have_content("El post se ha eliminado. ¡Ten un buen día!")

		visit posts_path

		expect(page).to have_no_content("Pierde Muchos Fondos")
	end
end