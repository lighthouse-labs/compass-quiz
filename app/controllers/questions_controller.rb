class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    @questions = Question.includes(:activity)
  end

  def show
  end

  def new
    @question = Question.new
    @question.activity_id = params[:activity_id]
    2.times { @question.options << Option.new }
  end

  def edit
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question, notice: "Question #{@question.id} was successfully created."
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: "Question #{@question.id} was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: "Question #{@question.id} was successfully destroyed."
  end

  protected

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :activity_id, :active, options_attributes: [:id, :answer, :explanation, :correct, :_destroy])
  end

end
