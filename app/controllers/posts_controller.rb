class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path, success: "Successfully Wrote Review"
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @post.update_attributes(post_params)
			redirect_to post_path(@post), success: "Review Successfully Updated"
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path, success: "Post Successfully Deleted"
	end

	private

	def set_post
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title, :body, :image)
	end
end