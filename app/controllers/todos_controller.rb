class TodosController < ApplicationController

  def index
    render "index"
  end

  def show
    id = params[:id]
    render plain: Todo.find(id).to_displayable_string
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def create
    text = params[:todo_text]
    date = DateTime.parse(params[:due_date])
    todo = Todo.create!(todo_text: text, due_date: date, completed: false)
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
