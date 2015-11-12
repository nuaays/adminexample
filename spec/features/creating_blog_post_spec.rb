require 'spec_helper'

feature 'Creating a Blog Post' do
	
	before do
		log_in_as!(FactoryGirl.create(:admin_user))
		visit posts_path
  		click_link 'Nuevo Blog Post'
	end
	
	scenario "Can Create a Post" do
		
		fill_in 'Nombre de la Noticia', with: "Ganan fondos para proyecto"
		fill_in 'Imagen', with: "https://www.nuva.rocks"
		fill_in 'Texto', with: "Grupo gana fondos y comienza actividades"
		fill_in 'Sitio Fuente', with: "http:www.nuva.rocks"

		click_button 'Create Post'

		expect(page).to have_content('¡Se ha creado el post! ¡Que buena noticia!')

		within "#author" do
  			expect(page).to have_content("Creado por ")	
		end
	end	

	scenario "Cannot Create a Post" do
		fill_in 'Imagen', with: "https://www.nuva.rocks"
		click_button 'Create Post'
		expect(page).to have_content('¡Ups, no se creo el post! ');

	end
end