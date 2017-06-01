class TodoItemsController < ApplicationController
  before_action :authorize, only: [:create, :destroy]


  # def index
  #   @todoitem = current_user.todo_lists.todo_items.all
  # end
  #
  # def show
  #   @todoitem = @todolist.todo_items.find(params[:todo_list_id])
  # end
  #
  # def new
  #   @todoitem = TodoItem.new
  # end

  # def edit
  #   @todolist = TodoList.find(params[:todo_list_id])
  #   @todoitem = @todolist.todo_items.find(params[:id])
  # end
  #
  # def update
  #   @todolist = TodoList.find(params[:todo_list_id])
  #   @todoitem = @todolist.todo_items.find(params[:id])
  #   @todoitem.update(todoitem_params)
  #   redirect_to todo_list_path
  # end
  def create
    @todolist = TodoList.find(params[:todo_list_id])
    @todoitem = @todolist.todo_items.new(todoitem_params)
    if @todoitem.save
        redirect_to '/todo_lists'
    else
        render 'new'
    end
  end


  def destroy
    @todolist = TodoList.find(params[:todo_list_id])
    @todoitem = @todolist.todo_items.find(params[:id])
    @todoitem.destroy
    redirect_to '/todo_lists'
  end


  private
  def todoitem_params
      params.require(:todo_item).permit(:item)
  end

end
