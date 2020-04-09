class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    #render plain: Todo.all.map {|todo| todo.to_string}.join("\n")
    render "index"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    render plain: "New Todo Created with the id #{new_todo.id}"
  end

  def show
    id=params[:id]
    todo=Todo.find(id)
    render plain: todo.to_string
  end
  def update
    id=params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "Updated the todo with id #{todo.id} status to #{completed}"
  end
end