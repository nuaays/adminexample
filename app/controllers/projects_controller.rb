class ProjectsController < ApplicationController
	before_action :require_login!, except: [:index, :show]
	before_action :set_project, only: [:show, :edit, :update, :destroy]
	before_action :checkProjects, only: [:new, :create, :edit, :update, :destroy]
	def index
		@projects = Project.all
	end

	def show
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)
		@project.user = current_user
		
		if @project.save
			flash[:notice] = "Se ha creado el proyecto"
			redirect_to @project
		else 
			flash[:alert] = "No se creo el proyecto"
			render :action => "new"
		end

	end

	def edit
	end

	def update
		if @project.update(project_params)
			flash[:notice] = "El proyecto se ha modificado."
			redirect_to @project
		else 
			flash[:alert] = "No se modifico el proyecto"
			render :action => "edit"
		end
	end


	def destroy 
		
		@project.destroy

		flash[:notice] = "El proyecto se ha eliminado."
		redirect_to projects_path
	end

	private
		def project_params
			params.require(:project).permit(:name, :email, :issue, :sector, :image, :phone, :album)
		end

		def set_project
			@project = Project.find(params[:id])

			rescue  ActiveRecord::RecordNotFound
			flash[:alert] = "Este no es el sitio que estabas buscando."
			redirect_to projects_path
			
		end

		
end
