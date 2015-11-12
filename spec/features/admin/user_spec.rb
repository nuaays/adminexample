require 'spec_helper'

feature "Creating Users" do
	let!(:admin_user) { FactoryGirl.create(:admin_user)}

	before do
		log_in_as!(admin_user)
		visit '/'
		click_link "Admin Panel"
		click_link "Usuarios"
		click_link "Nuevo Usuario"
	end

	scenario "Creating new users" do
		fill_in "Nombre", with: "Ilse Alejo"
		fill_in "Email", with: "ilse@gmail.com"
		fill_in "user[password]", with: "qwerty"
		fill_in "Password confirmation", with: "qwerty"

		click_button "Crear Usuario"
		expect(page).to have_content("El nuevo usuario se ha creado.")
	end
end