class QuizzesController < ApplicationController

  before_action :set_quiz, only: [:show, :destroy]

  def index
    set_quizzes
    @quiz = Quiz.new
  end

  def show
  end

  def create
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to @quiz, notice: "Quiz #{@quiz.uuid} was successfully created."
    else
      set_quizzes
      render :index
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: "Quiz #{@quiz.uuid} was successfully destroyed."
  end

  protected

  def set_quiz
    @quiz = Quiz.find_by(uuid: params[:id])
  end

  def set_quizzes
    @quizzes = Quiz.unscope(:order).order(created_at: :desc)
  end

  def quiz_params
    params.require(:quiz).permit(:cohort_id, :day)
  end

end
