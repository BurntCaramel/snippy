class SnippetsController < ApplicationController
  before_action :set_snippet, only: [:show, :edit, :update, :destroy]

  def index
    @query = params[:q]
    if @query.blank?
      @snippets = Snippet.all.includes(:category)
    else
      @snippets = Snippet.search(@query)
    end
  end

  def new
    @snippet = Snippet.new
  end

  def create
    # Create a new model object with that data
    @snippet = Snippet.new(snippet_params)
    # Attempt to save that model to the database
    if @snippet.save
      # If saved, then redirect to that snippet’s page
      redirect_to @snippet, notice: 'Your snippet was created'
    else
      # Otherwise, show the user the form again with errors
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # Update model object with that data
    if @snippet.update_attributes(snippet_params)
      # If saved, then redirect to that snippet’s page
      redirect_to @snippet, notice: 'Your snippet was updated'
    else
      # Otherwise, show the user the form again with errors
      render :edit
    end
  end

  def destroy
    @snippet.destroy
  end

  private
    def set_snippet
      @snippet = Snippet.find(params[:id])
    end

    # Get the submitted form data from params
    def snippet_params
      params.require(:snippet).permit(:title, :description, :code, :category_id)
    end
end
