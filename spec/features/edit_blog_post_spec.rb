require 'spec_helper'

feature "Editing a blog post" do
	
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
		click_link "Edit Post"
	end
	scenario "Can Update a post" do
		
		fill_in "Nombre de la Noticia", with: "No Gana Fondos"
		click_button "Update Post"

		expect(page).to have_content("El post se ha modificado. ¡Yeah!")
	end



end