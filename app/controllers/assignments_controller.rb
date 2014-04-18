class AssignmentsController < ApplicationController

  def create
    @assignment = Assignment.new(assignment_params)
    if @assignment.save
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def assignment_params
    params.require(:assignment).permit(:user_id, :role_id)
  end

end
