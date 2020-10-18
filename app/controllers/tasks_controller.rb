class TasksController < ApplicationController
  before_action :set_user
  
  def index
    @tasks = @user.tasks.order(created_at: :asc)
  end
  
  def show
    @task = @user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = @user.tasks.new(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @task = @user.tasks.find(params[:user_id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスク情報を更新しました。"
      redirect_to user_task_path(@user, @task)
    else
      render :edit
    end
  end
  
  
  
  def edit
  end
  
  private
  
    def task_params
      params.permit(:name, :description)
    end
    
    def set_user
      @user = User.find(params[:user_id])
    end
    
    def set_task
      @task = @user.tasks.find_by(id: params[:id])
      redirect_to user_tasks_url @user
    end
    
end
