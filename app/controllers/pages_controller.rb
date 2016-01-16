class PagesController < ApplicationController

  def home
    @page = {
      activities: model_stats(Activity),
      cohorts: model_stats(Cohort),
      questions: model_stats(Question),
      quizzes: model_stats(Quiz),
      students: model_stats(Student),
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
