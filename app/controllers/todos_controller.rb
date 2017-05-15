class TodosController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :show, :destory]
  
  def new
    @todo = Todo.new
  end
  
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo was created successfully"
      redirect_to todo_path(@todo)
    else
      render 'new'
    end
  end

  def show
  end
  
  def edit
  end
  
  def destroy
    @todo.destroy
    flash[:notice] = "Todo was deleted successfully"
    redirect_to todos_path
    
  end
  
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Todo successfully updated"
      redirect_to todo_path(@todo)
    else
      render 'edit'
    end
  end
  
  def index
    @Todos = Todo.all
  end
  
  
  private 
  
  def set_todo
    @todo = Todo.find(params[:id])
  end
  
  def todo_params
    params.require(:todo).permit(:name, :description)
  end
  
end