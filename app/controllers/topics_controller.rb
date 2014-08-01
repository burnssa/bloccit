class TopicsController < ApplicationController
  def index
  	@topics = Topic.all
    authorize @topics
  end

  def new
  	@topic = Topic.new
    authorize @topic
  end

  def show
  	@topic = Topic.find(params[:id])
  	@posts = @topic.posts
  	authorize @topic
  end

  def edit
  	@topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
  	@topic = Topic.new(params.require(:topic).permit(:name, :public, :description))
    authorize @topic
  	if @topic.save
  		flash[:notice] = "topic was saved."
  		redirect_to @topic
  	else
  		flash[:error] = "There was an error saving the topic. Please try again."
  		render :new
  	end
  end

 	def update
  	@topic = Topic.find(params[:id])
    authorize @topic
  	if @topic.update_attributes(params.require(:topic).permit(:name, :public, :description))
  		flash[:notice] = "topic was updated."
  		redirect_to @topic
  	else
  		flash[:error] = "There was an error saving the topic. Please try again."
  		render :edit
  	end
  end

end