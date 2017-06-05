class SearchController < ApplicationController
  def search
    if params[:term].nil?
      @todolist = []
    else
      @todolist = TodoList.search params[:term]
    end
  end
end
  
