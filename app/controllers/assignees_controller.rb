class AssigneesController < ApplicationController
def index 
    @assignees = Assignee.all
  end

  def new
    @new_assignee = Assignee.new
  end

  def create
    @new_assignee = Assignee.new(assignee_params)
    if @new_assignee.save
      redirect_to assignees_path
    else
      redirect_to new_assignee_path
    end
  end

  def show
    @assignee = Assignee.find(params[:id])
  end

  def edit
    @assignee = Assignee.find(params[:id])
  end

  def update
    @assignee = Assignee.find(params[:id])
    if @assignee.update_attributes(assignee_params)
      redirect_to assignees_path
    else
      redirect_to assignee_path
    end
  end

  def destroy
    @assignee = Assignee.find(params[:id])

    if @assignee.delete
      redirect_to assignees_path
    end
  end


  private

  def assignee_params
    params.require(:assignee).permit!
  end 
end

