class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(params[:user_id])
    @task.save
    redirect_to user_tasks_url
  end
  
  def edit
  end
end
