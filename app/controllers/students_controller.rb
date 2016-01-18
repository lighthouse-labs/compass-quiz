class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :destroy, :update]

  def index
    @students = Student.order(:github_username)
  end

  def show
    @submission_stats = @student.submissions.stats
  end

  def update
    if @student.update(student_params)
      redirect_to @student, notice: 'The student was successfully updated.'
    else
      render :show
    end
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: 'The student was successfully destroyed.'
  end

  protected

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:cohort_id, :compass_primary_key, :github_username)
  end

end
