class SnippetsController < ApplicationController
  def index
    @snippets = Snippet.all
  end

  def new
    @snippet = Snippet.new
  end
end
