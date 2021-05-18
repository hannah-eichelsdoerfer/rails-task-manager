class TasksController < ApplicationController
  # Refactoring: Subset of the 7 routes (dry code) before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id]) # optional if refactoring
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id]) # optional if refactoring
  end

  def update
    @task = Task.find(params[:id]) # optional if refactoring
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  private
  
  # When refactoring:
  # def set_task
  #   @task = Task.find(params[:id])
  # end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end

# Track if input box was clicked (value was checked or unchecked)
# Read the value for "completed" of task
# make it persistent
