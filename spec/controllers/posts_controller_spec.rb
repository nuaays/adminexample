require 'spec_helper'

describe PostsController do
	it "displays an error for a missing post" do
		get :show, :id => "not-here"
		expect(response).to redirect_to(posts_path)
		message = "Este no es el sitio que estabas buscando, joven padawan."
		expect(flash[:alert]).to eql(message)
	end

	
end
