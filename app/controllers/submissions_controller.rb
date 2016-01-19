class SubmissionsController < ApplicationController

  before_action :set_submission, only: [:show, :destroy]

  skip_before_action :authenticate_user, only: [:new, :create, :show]

  def new
    @student_error = false
    quiz = Quiz.find_by!(uuid: params[:quiz_id])
    @submission = Submission.new(quiz: quiz)
    render layout: 'public'
  end

  def create
    @student_error = false
    @submission = Submission.new(submission_params)
    begin
      @submission.student = Student.find_or_create_by!(github_username: params[:student][:github_username])
      @submission.student.update_attributes cohort: @submission.quiz.cohort
    rescue ActiveRecord::ActiveRecordError
      @student_error = true
    end
    if !@student_error && @submission.save
      redirect_to @submission
    else
      render :new, layout: 'public'
    end
  end

  def show
    @submission = Submission.find_by(uuid: params[:id])
    render layout: 'public'
  end

  def destroy
    @submission.destroy
    redirect_to @submission.try(:quiz) || @submission.try(:student) || root_url, notice: 'The submission was successfully destroyed.'
  end

  protected

  def set_submission
    @submission = Submission.find_by(uuid: params[:id])
  end

  def submission_params
    params.require(:submission).permit(:quiz_id, answers_attributes: [:option_id])
  end

end
