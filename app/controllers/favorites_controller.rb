class FavoritesController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.build(post: @post)
		authorize favorite

		if favorite.save
       flash[:notice] = "Post was favorited."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "Post couldn't be favorited. Try again."
       redirect_to [@post.topic, @post]
     end
	end

	def destroy
		@post = Post.find(params[:post_id])
		favorite = current_user.favorites.find_by_post_id(@post.id)
		authorize favorite

		if favorite.destroy
       flash[:notice] = "You have unfavorited the post."
       redirect_to [@post.topic, @post]
     else
       flash[:error] = "Post couldn't be unfavorited. Try again."
       redirect_to [@post.topic, @post]
     end
	end
end
