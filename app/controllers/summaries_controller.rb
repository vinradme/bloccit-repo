class SummariesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.new
    authorize @summary
  end

  def show
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def edit
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary
  end

  def create
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.new(params.require(:summary).permit(:description))
    authorize @summary
    if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@topic, @post, @summary]
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @topic = Topic.find(params[:topic_id])
    @summary = Summary.find(params[:id])
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:description))
      flash[:notice] = "Summary was updated"
      redirect_to [@topic, @post, @summary ]
    else
      flash[:error] = "There was an error in saving the summary. Please try again"
      render :edit
    end
  end
end
