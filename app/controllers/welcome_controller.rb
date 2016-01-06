class WelcomeController < ApplicationController

  def index
    @welcome = {
      questions_count: Question.count,
      cohorts_count: Cohort.count,
      activities_count: Activity.count
    }
  end

end
