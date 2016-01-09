class QuizzesController < ApplicationController

  def index
    @quizzes = Quiz.all
    @quiz = Quiz.new
  end

  def show
    @quiz = Quiz.find_by(uuid: params[:id])
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: "Quiz #{@quiz.uuid} was successfully created."
    else
      @quizzes = Quiz.all
      render :index
    end
  end

  protected

  def quiz_params
    params.require(:quiz).permit(:cohort_id, :day)
  end

end
