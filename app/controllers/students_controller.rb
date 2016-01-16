class StudentsController < ApplicationController

  def index
    @cohorts = Cohort.includes(:students).joins(:students).order('students.github_username')
  end

  def show
    @student = Student.find(params[:id])
  end

end
