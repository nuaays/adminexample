require 'spec_helper'

feature 'Creating a Project' do
	
	before do
		log_in_as!(FactoryGirl.create(:admin_user))
		visit projects_path
		click_link 'Nuevo Proyecto'
	end
	
	scenario "Can Create a Project" do
		
		fill_in 'Nombre', with: "NUVA"
		fill_in 'Email', with: "hola@nuva.rocks"
		fill_in 'Problema', with: "no hay medicamentos"
		fill_in 'Sector', with: "Salud"
		fill_in 'Aportación', with: "Listar medicamentos requeridos"

		click_button 'Create Project'

		expect(page).to have_content('Se ha creado el proyecto')
		within "#author" do
  			expect(page).to have_content("Creado por ")	
		end
	end	

	scenario "Cannot Create a Project" do
		fill_in 'Email', with: "hola@nuva.rocks"
		click_button 'Create Project'
		expect(page).to have_content('No se creo el proyecto');

	end
end