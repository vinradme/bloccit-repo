class SummariesController < ApplicationController

  def index
    @summaries = Summary.all
    authorize @summaries
  end

  def new
    @summary = Summary.new
    @post = @summary.post
    authorize @summary
  end

  def show
     @summary = Summary.find(params[:id])
     @post = @summary.post
     authorize @summary
  end

  def edit
    @summary = Summary.find(params[:id])
    @post = @summary.post
    authorize @summary
  end

  def create
    @summary = Summary.new(params.require(:summary).permit(:description))
    @post = @summary.post
    authorize @summary
    if @summary.save
      redirect_to @summary, notice: "Summary was saved successfully"
    else
      flash[:error] = "There was an error saving the summary. Please try again."
      render :new
    end
  end

  def update
    @summary = Summary.find(params[:id])
    @post = Post.find(params[:id])
    @summary.post = @post
    authorize @summary
    if @summary.update_attributes(params.require(:summary).permit(:description))
      flash[:notice] = "Summary was updated"
      redirect_to @summary
    else
      flash[:error] = "There was an error in saving the summary. Please try again"
      render :edit
    end
  end
end
