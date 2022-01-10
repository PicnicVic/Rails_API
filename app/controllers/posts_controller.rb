class PostsController < ApplicationController
  # FOR COMMENTS
  before_action :set_park, only: [:show]
  before_action :authenticate, only: [:create, :update, :destroy]

  # THIS SHOWS ALL COMMENTS FOR EVERY PARK. WE DON'T WANT THIS
  def index
    posts = Post.all
    render json: posts, include: { park: { only: :name }, user: { only: :username } }, status: 200
  end

  # PSEUDO CODE
  # Rendering comments that are ONLY for that particular park
  def show
    render json: @posts, include: { park: { only: :name }, user: { only: :username } }, status: 200
  end

  def create
    post = current_user.posts.create(post_params)
    unless post.errors.any?
      render json: @posts, include: { park: { only: :name }, user: { only: :username } }, status: 201
    else
      render json: {errors: post.errors.full_messages}, status: 422
    end
  end

  # private

  def set_park
    begin
      @park = Park.find(params[:id])
    rescue
      # Will run if exception is raised
      render json: { error: "Could not find this park" }, status: 404
    end
  end

  def post_params
      params.require(:post).permit(:user_id, :park_id, :comment, :rating)
  end
end
