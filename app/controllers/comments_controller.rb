class CommentsController < ApplicationController
  respond_to :html, :js

	def create
  	@post = Post.find(params[:post_id])
    @topic = @post.topic
    @comments = @post.comments

    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    authorize @comment
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
      @post = Post.find(params[:post_id])
      @topic = @post.topic
      @comment = @post.comments.find(params[:id])

      authorize @comment
      if @comment.destroy
        flash[:notice] = "Comment was removed."
      else
        flash[:error] = "Comment couldn't be deleted. Try again."
      end

      respond_with(@comment) do |format|
        format.html { redirect_to [@post.topic, @post]}
      end
   end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end