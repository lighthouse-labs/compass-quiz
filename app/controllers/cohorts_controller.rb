class CohortsController < ApplicationController

  before_action :set_cohort, only: [:show, :destroy, :update]

  def index
    @cohorts = Cohort.all
    @cohort = Cohort.new
  end

  def show
    @submission_stats = Submission
      .select(:uuid, :student_id, :quiz_id, 'options.correct AS options_correct', 'COUNT(answers.id) AS answers_count')
      .group(:id, 'options.correct')
      .joins(:quiz)
      .where(quizzes: { cohort_id: @cohort.id })
      .joins('LEFT JOIN answers ON answers.submission_id = submissions.id')
      .joins('LEFT JOIN options ON answers.option_id = options.id')
      .order('options.correct')
  end

  def create
    @cohort = Cohort.new(cohort_params)
    if @cohort.save
      redirect_to cohorts_url, notice: "#{cohort_name(@cohort)} was successfully created."
    else
      @cohorts = Cohort.all
      render :index
    end
  end

  def update
    if @cohort.update(cohort_params)
      redirect_to @cohort, notice: "#{cohort_name(@cohort)} was successfully updated."
    else
      render :show
    end
  end

  def destroy
    @cohort.destroy
    redirect_to cohorts_url, notice: "#{cohort_name(@cohort)} was successfully destroyed."
  end

  def cohort_name(cohort)
    name = cohort.try(:name)
    name = 'Cohort' if name.blank?
    name
  end

  helper_method :cohort_name

  protected

  def set_cohort
    @cohort = Cohort.find(params[:id])
  end

  def cohort_params
    params.require(:cohort).permit(:name, :compass_install, :compass_primary_key)
  end

end
