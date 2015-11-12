class WelcomeController < ApplicationController
	before_action :require_login!, except: [:index, :show]
	def index
		
	end
end