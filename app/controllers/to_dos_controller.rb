class ToDosController < ApplicationController

  def index 
    @to_dos = ToDo.all
  end

  def new
    @new_to_do = ToDo.new
  end

  def create
    @new_to_do = ToDo.new(to_do_params)
    if @new_to_do.save
      redirect_to to_dos_path
    else
      redirect_to new_to_do_path
    end
  end

  def show
    @to_do = ToDo.find(params[:id])
  end

  def edit
    @to_do = ToDo.find(params[:id])
  end

  def update
    @to_do = ToDo.find(params[:id])
    if @to_do.update_attributes(to_do_params)
      redirect_to to_dos_path
    else
      redirect_to to_do_path
    end
  end

  def destroy
    @to_do = ToDo.find(params[:id])

    if @to_do.delete
      redirect_to to_dos_path
    end
  end

  def todolist
    @to_dos = ToDo.incomplete
  end

  def completed
    @to_dos = ToDo.completed
  end


  private

  def to_do_params
    params.require(:to_do).permit!
  end 
end
