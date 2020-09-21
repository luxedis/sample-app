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
end
