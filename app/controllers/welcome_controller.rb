class WelcomeController < ApplicationController

  def index
    @welcome = {
      cohorts_count: Cohort.count,
      activities_count: Activity.count
    }
  end

end
