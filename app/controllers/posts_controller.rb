class PostsController < ApplicationController
	before_action :require_login!, except: [:index, :show]
	before_action :set_post, only: [:show, :edit, :update, :destroy]
	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		if @post.save
			flash[:notice] = "¡Se ha creado el post! ¡Que buena noticia!"
			redirect_to @post
		else 
			flash[:alert] = "¡Ups, no se creo el post!"
			render :action => "new"
		end

	end

	def edit
	end

	def update
		if @post.update(post_params)
			flash[:notice] = "El post se ha modificado."
			redirect_to @post
		else 
			flash[:alert] = "¡Ups, no se modifico el post!"
			render :action => "edit"
		end
	end

	def show
	end

	def destroy 
		
		@post.destroy

		flash[:notice] = "El post se ha eliminado. ¡Ten un buen día!"
		redirect_to posts_path
	end

	private
		def post_params
			params.require(:post).permit(:name, :image, :news, :source, :shortlink)
		end

		def set_post
			@post = Post.find(params[:id])

			rescue  ActiveRecord::RecordNotFound
			flash[:alert] = "Este no es el sitio que estabas buscando, joven padawan."
			redirect_to posts_path
			
		end

		
  	
end
