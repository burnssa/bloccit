class CommentsController < ApplicationController
	def create
    @topic = Topic.find(params[:topic_id])
  	@post = Post.find(params[:post_id])
    @comments = @post.comments

    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    #authorize @comment
    Rails.logger.info ">>>>>>>>>  #{@comment.inspect}"
    Rails.logger.info  ">>>>>>>> valid? #{@comment.valid?}"

  	if @comment.save
  		flash[:notice] = "Comment was saved."
  	else
  		flash[:error] = "There was a #{@comment.body} error saving the comment. Please try again."
  	end
    redirect_to [@topic, @post]
  end 

   def destroy
     @topic = Topic.find(params[:topic_id])
     @post = @topic.posts.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
 
     authorize @comment
     if @comment.destroy
       flash[:notice] = "Comment was removed."
       redirect_to [@topic, @post]
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
       redirect_to [@topic, @post]
     end
   end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end