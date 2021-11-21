class TodosController < ApplicationController

  def index
    @todos = Todo.of_user(current_user)
    render "index"
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def create
    text = params[:todo_text]
    date = params[:due_date]
    todo = Todo.new(todo_text: text, due_date: date, completed: false, user_id: current_user.id)
    if todo.save
      redirect_to todos_path
    else
      flash[:error] = todo.errors.full_messages.join(", ")
      redirect_to todos_path
    end
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
