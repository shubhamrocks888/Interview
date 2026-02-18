### app/controller/api/v1/posts_controller.rb

class Api::V1::PostsController < ApplicationController


	def index
		@posts = Post.all

		render json: Post.all
	end

	def create
		post = Post.new(post_params)

		if post.save
			PostCreatedJob.perform_later(post.id)
			render json: post, status: :created
		else
			render json: { error: post.errors}, status: :unprocessable_entity
		end
	end

	

	def show
		render json: @post
	end


	def update
		if @post.update(post_params)
			render json: @post
		else
		end
	end

	def destroy
		@post.destroy
		head :no_content
	end

	private

	def set_post
		@post = Post.find_by(id: params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :content)
	end
end