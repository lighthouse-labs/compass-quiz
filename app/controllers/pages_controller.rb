class PagesController < ApplicationController

  def home
    @page = {
      questions: model_stats(Question),
      cohorts: model_stats(Cohort),
      activities: model_stats(Activity),
      quizzes: model_stats(Quiz),
      users: model_stats(User)
    }
    @quiz = Quiz.new
  end

  protected

  def model_stats(model)
    {
      count: model.count,
      last_updated: model.unscoped.select(:updated_at).order(updated_at: :desc).limit(1).first.try(:updated_at)
    }
  end

end
