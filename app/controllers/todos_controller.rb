class TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update destroy ]

  # GET /todos or /todos.json
  def index
    @todos = Todo.all.order(limit: "DESC")
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo, notice: I18n.t('todos.create.successfully_created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: I18n.t('todos.update.successfully_updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  def destroy
    @todo.destroy
    redirect_to todos_url, notice: I18n.t('todos.destroy.successfully_destroyed')
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :detail, :state, :limit)
  end
end
