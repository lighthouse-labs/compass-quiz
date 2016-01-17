class StudentsController < ApplicationController

  before_action :set_student, only: [:show, :destroy]

  def index
    @students = Student.order(:github_username)
  end

  def show
    @submission_stats = @student.submissions.stats
  end

  def destroy
    @student.destroy
    redirect_to students_path, notice: 'The student was successfully destroyed.'
  end

  protected

  def set_student
    @student = Student.find(params[:id])
  end

end
