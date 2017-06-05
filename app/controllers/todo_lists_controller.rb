class TodoListsController < ApplicationController
  before_action :authorize, only: [:new, :index, :show, :edit, :update, :destroy]


  def index
    @todolists = current_user.todo_lists.all
  end

  def show
    
    @todolist = current_user.todo_lists.find(params[:id])
    @todoitem = TodoItem.new
    @todoitems = @todolist.todo_items

  end

  def new
    @todolist = TodoList.new
  end

  def create
    @todolist = current_user.todo_lists.new(todolist_params)
    if @todolist.save
        redirect_to '/todo_lists'
    else
        render 'new'
    end
  end

  def edit
    @todolist = TodoList.find(params[:id])
  end

  def update
    @todolist = TodoList.find(params[:id])
    @todolist.update(todolist_params)
    redirect_to todo_list_path
  end

  def destroy
    @todolist = TodoList.find(params[:id])
    @todolist.destroy
    redirect_to '/todo_lists'
  end


  private
  def todolist_params
      params.require(:todo_list).permit(:title, :description)
  end

end
